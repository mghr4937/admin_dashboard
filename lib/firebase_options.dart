// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDrd-2K_UmX6zqzvkmdAbrc0FoxolklPoE',
    appId: '1:386887037600:web:108cb329441993cfcd8fc5',
    messagingSenderId: '386887037600',
    projectId: 'fuubol-87f52',
    authDomain: 'fuubol-87f52.firebaseapp.com',
    storageBucket: 'fuubol-87f52.appspot.com',
    measurementId: 'G-ZEL520L2N8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNJ0VpvZjblt-u_kdkD7xB0Up0UKfY0aw',
    appId: '1:386887037600:android:13fddca14ccfbefacd8fc5',
    messagingSenderId: '386887037600',
    projectId: 'fuubol-87f52',
    storageBucket: 'fuubol-87f52.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7WcYtHQjfABZwxer3BmafmRDG9OCdzvY',
    appId: '1:386887037600:ios:ea8e44b63a442053cd8fc5',
    messagingSenderId: '386887037600',
    projectId: 'fuubol-87f52',
    storageBucket: 'fuubol-87f52.appspot.com',
    iosClientId: '386887037600-mrac647412aau2lka1snn9stfumfe99n.apps.googleusercontent.com',
    iosBundleId: 'com.example.adminDashboard',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC7WcYtHQjfABZwxer3BmafmRDG9OCdzvY',
    appId: '1:386887037600:ios:ea8e44b63a442053cd8fc5',
    messagingSenderId: '386887037600',
    projectId: 'fuubol-87f52',
    storageBucket: 'fuubol-87f52.appspot.com',
    iosClientId: '386887037600-mrac647412aau2lka1snn9stfumfe99n.apps.googleusercontent.com',
    iosBundleId: 'com.example.adminDashboard',
  );
}
