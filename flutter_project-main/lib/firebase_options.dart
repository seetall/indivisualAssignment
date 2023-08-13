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
    apiKey: 'AIzaSyAvjx7Muwf29dJyUXeVr1xrVrmjbODDyhY',
    appId: '1:206517623622:web:270bc519c5747ec4e52347',
    messagingSenderId: '206517623622',
    projectId: 'indi-assignment',
    authDomain: 'indi-assignment.firebaseapp.com',
    storageBucket: 'indi-assignment.appspot.com',
    measurementId: 'G-WDWSP2L074',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCAVWmbrM_y_zmTTBT0p7aqeFcjy8EnCyg',
    appId: '1:206517623622:android:0ec180ac6d8f7561e52347',
    messagingSenderId: '206517623622',
    projectId: 'indi-assignment',
    storageBucket: 'indi-assignment.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgW4_VFiFWH-ezp6dcsNQFzJQsAsQPBGk',
    appId: '1:206517623622:ios:02747dc5a076b4f0e52347',
    messagingSenderId: '206517623622',
    projectId: 'indi-assignment',
    storageBucket: 'indi-assignment.appspot.com',
    iosClientId: '206517623622-svrl0t376bb3v9qf1ct1mrqb67406fqf.apps.googleusercontent.com',
    iosBundleId: 'com.example.nBaz',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgW4_VFiFWH-ezp6dcsNQFzJQsAsQPBGk',
    appId: '1:206517623622:ios:02747dc5a076b4f0e52347',
    messagingSenderId: '206517623622',
    projectId: 'indi-assignment',
    storageBucket: 'indi-assignment.appspot.com',
    iosClientId: '206517623622-svrl0t376bb3v9qf1ct1mrqb67406fqf.apps.googleusercontent.com',
    iosBundleId: 'com.example.nBaz',
  );
}
