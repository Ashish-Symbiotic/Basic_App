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
    apiKey: 'AIzaSyDp8ELyYbDhRszdrbj1zKBY6B8uhgE8Q7U',
    appId: '1:555609719913:web:34da321d1307a5a516cef8',
    messagingSenderId: '555609719913',
    projectId: 'phoneauthflutter-419821',
    authDomain: 'phoneauthflutter-419821.firebaseapp.com',
    storageBucket: 'phoneauthflutter-419821.appspot.com',
    measurementId: 'G-PL5PGQHJDN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZ0ZYRIkac7pkhC4xZv4zBn8VCWOUsReY',
    appId: '1:555609719913:android:9e349a5318e6a8b016cef8',
    messagingSenderId: '555609719913',
    projectId: 'phoneauthflutter-419821',
    storageBucket: 'phoneauthflutter-419821.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4wVgIeLYdB_VGxiG_aPtjBGaS1AHzv4M',
    appId: '1:555609719913:ios:e7b1cd55f2bd7cde16cef8',
    messagingSenderId: '555609719913',
    projectId: 'phoneauthflutter-419821',
    storageBucket: 'phoneauthflutter-419821.appspot.com',
    iosBundleId: 'com.example.basicApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD4wVgIeLYdB_VGxiG_aPtjBGaS1AHzv4M',
    appId: '1:555609719913:ios:e7b1cd55f2bd7cde16cef8',
    messagingSenderId: '555609719913',
    projectId: 'phoneauthflutter-419821',
    storageBucket: 'phoneauthflutter-419821.appspot.com',
    iosBundleId: 'com.example.basicApp',
  );
}