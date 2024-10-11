// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCcio111PgjmtxJpRQnGKvoNsXUK1ogEcU',
    appId: '1:847170506685:web:41064b1b49c9bfe7d94cd4',
    messagingSenderId: '847170506685',
    projectId: 'yemen-storee',
    authDomain: 'yemen-storee.firebaseapp.com',
    storageBucket: 'yemen-storee.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwmDPZpjc0gxJrwjMIol5EUcO30MqzS50',
    appId: '1:847170506685:android:9a695f086eb55871d94cd4',
    messagingSenderId: '847170506685',
    projectId: 'yemen-storee',
    storageBucket: 'yemen-storee.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4Ql287FeU3U9kDF3KFF_cLzmwMSBbgY8',
    appId: '1:847170506685:ios:d65fceeaefb207ced94cd4',
    messagingSenderId: '847170506685',
    projectId: 'yemen-storee',
    storageBucket: 'yemen-storee.appspot.com',
    iosBundleId: 'com.example.eCommerceApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCcio111PgjmtxJpRQnGKvoNsXUK1ogEcU',
    appId: '1:847170506685:web:1b419d69bf2476f8d94cd4',
    messagingSenderId: '847170506685',
    projectId: 'yemen-storee',
    authDomain: 'yemen-storee.firebaseapp.com',
    storageBucket: 'yemen-storee.appspot.com',
  );
}
