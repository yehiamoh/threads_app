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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKp89v6-co9H-XOYjB_07FJBthalxO8dE',
    appId: '1:350870682165:android:9e9a42d6f54c2e52c28f7c',
    messagingSenderId: '350870682165',
    projectId: 'yehia-threads',
    storageBucket: 'yehia-threads.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYRNirWkvHkDL7JiqwCTmmL99xRTbKsQc',
    appId: '1:350870682165:ios:4676175fc1718e98c28f7c',
    messagingSenderId: '350870682165',
    projectId: 'yehia-threads',
    storageBucket: 'yehia-threads.appspot.com',
    androidClientId: '350870682165-trqkt2r1lufcbflkqqeip4eu50ultngv.apps.googleusercontent.com',
    iosClientId: '350870682165-c2uu6svbih7ub9glto89klbamccttand.apps.googleusercontent.com',
    iosBundleId: 'com.example.threads',
  );
}