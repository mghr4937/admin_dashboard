import 'package:admin_dashboard/models/user_data.dart';
import 'package:admin_dashboard/repositories/user_data_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus { uninitialized, authenticated, authenticating, unauthenticated }

class AuthenticationProvider extends ChangeNotifier {
  late User _user;
  late UserData _userData = UserData(role: '', displayName: '', email: '', uid: '');
  AuthStatus status = AuthStatus.unauthenticated;

  User get getUser => _user;
  UserData get getUserData => _userData;

  final UserDataRepository repository = UserDataRepository();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> signInWithGoogle() async {
    User? user;
    late UserCredential userCredential;
    try {
      // The `GoogleAuthProvider` can only be used while running on the web
      if (kIsWeb) {
        await Firebase.initializeApp();
        // Trigger the authentication flow
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        // Once signed in, return the UserCredential
        userCredential = await _auth.signInWithCredential(credential);
      } else {
        final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
        if (googleSignInAccount != null) {
          final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

          final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          );
          userCredential = await _auth.signInWithCredential(credential);
        }
      }

      user = userCredential.user;
      if (user != null) {
        _user = user;

        _saveUserInFirestore();

        status = AuthStatus.authenticated;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('auth', true);

        notifyListeners();
        NavigationService.replaceTo(Flurorouter.dashboardPath);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        NotificationService.showSnackBarError('Oppps, Credenciales invalidas :)');
      }
    } catch (e) {
      print(e);
      NotificationService.showSnackBarError('Oppps, Algo salio mal. Intente nuevamente :)');
    }
  }

  void _saveUserInFirestore() async {
    try {
      bool exists = await _doesEmailAlreadyExist(_user.email!);
      if (!exists) {
        _userData = UserData.fromFirebaseAuth(_user);
        users.add(_userData.toMap());
      } else {
        _userData = await repository.getUserByEmail(_user.email!);
      }
    } catch (e) {
      print(e);
      NotificationService.showSnackBarError('Oppps, Algo salio mal. Guardando sus datos)');
    }
  }

  Future<bool> _doesEmailAlreadyExist(String email) async {
    return await users.where('email', isEqualTo: email).get().then((value) {
      if (value.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    });
  }

  void signUpUser(String email, String password, String name) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        _user = userCredential.user!;
        await _auth.currentUser!.updateDisplayName(name);
        await _auth.currentUser!.reload();

        _user = _auth.currentUser!;
        _auth.userChanges();
        _saveUserInFirestore();

        status = AuthStatus.authenticated;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('auth', true);

        notifyListeners();
        NavigationService.replaceTo(Flurorouter.dashboardPath);
      }
    } catch (e) {
      print(e);
      NotificationService.showSnackBarError('Oppps, Algo salio mal. Intente nuevamente :)');
    }
  }

  void loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        _user = userCredential.user!;
        // _userData =
        _userData = await repository.getUserByEmail(_user.email!);

        status = AuthStatus.authenticated;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('auth', true);

        notifyListeners();
        NavigationService.replaceTo(Flurorouter.dashboardPath);
      }
    } catch (e) {
      print(e);
      NotificationService.showSnackBarError('Oppps, Algo salio mal. Intente nuevamente :)');
    }
  }

  bool isAuthenticated() {
    if (_auth.currentUser != null) {
      return true;
    }
    return false;
  }

  Future signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      status = AuthStatus.unauthenticated;
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await _auth.signOut();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('auth', false);

      notifyListeners();
    } catch (e) {
      NotificationService.showSnackBarError('Oppps, Algo salio mal. Intente nuevamente :)');
    }
  }
}
