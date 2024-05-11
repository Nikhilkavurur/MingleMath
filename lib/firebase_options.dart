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
    apiKey: 'AIzaSyB1eNTDiK6vfNxd9XnjVrxQ_OQHgPZ4h-0',
    appId: '1:492732949895:web:4d8cf3ba0ab03aaa4a5f22',
    messagingSenderId: '492732949895',
    projectId: 'minglemath-db',
    authDomain: 'minglemath-db.firebaseapp.com',
    storageBucket: 'minglemath-db.appspot.com',
    measurementId: 'G-50B371JZGS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCw8DZ7gtc__a-mlsYamWQdAnxxlmeEch8',
    appId: '1:492732949895:android:54b2d5fe12f5dea44a5f22',
    messagingSenderId: '492732949895',
    projectId: 'minglemath-db',
    storageBucket: 'minglemath-db.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQFHXuWFr0aq2rZyNpMZjyB65yhZp2FNM',
    appId: '1:492732949895:ios:49c01b4d4edd861c4a5f22',
    messagingSenderId: '492732949895',
    projectId: 'minglemath-db',
    storageBucket: 'minglemath-db.appspot.com',
    iosBundleId: 'com.example.minglemath',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCQFHXuWFr0aq2rZyNpMZjyB65yhZp2FNM',
    appId: '1:492732949895:ios:5f2db58ca03a9fc64a5f22',
    messagingSenderId: '492732949895',
    projectId: 'minglemath-db',
    storageBucket: 'minglemath-db.appspot.com',
    iosBundleId: 'com.example.minglemath.RunnerTests',
  );
}