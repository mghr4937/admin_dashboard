import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum AuthStatus { uninitialized, authenticated, authenticating, unauthenticated }

class AuthenticationProvider extends ChangeNotifier {
  late User _user;
  AuthStatus status = AuthStatus.unauthenticated;

  User get getUser => _user;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  void signInWithGoogle() async {
    User? user;
    late UserCredential userCredential;
    try {
      // The `GoogleAuthProvider` can only be used while running on the web
      if (kIsWeb) {
        GoogleAuthProvider authProvider = GoogleAuthProvider();
        userCredential = await _auth.signInWithPopup(authProvider);
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

        status = AuthStatus.authenticated;
        notifyListeners();
        NavigationService.replaceTo(Flurorouter.dashboardPath);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        NotificationService.showSnackBarError('Oppps, Credenciales invalidas :)');
      }
    } catch (e) {
      NotificationService.showSnackBarError('Oppps, Algo salio mal. Intente nuevamente :)');
    }
  }

  void signUpUser(String email, String password, String name) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        _user = userCredential.user!;
        _user.updateDisplayName(name);

        status = AuthStatus.authenticated;
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

        status = AuthStatus.authenticated;
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
      notifyListeners();
    } catch (e) {
      NotificationService.showSnackBarError('Oppps, Algo salio mal. Intente nuevamente :)');
    }
  }
}