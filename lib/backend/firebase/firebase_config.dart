import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBSbHKOlGS1ndnwNMYg66Ym0w8TfnQaPHo",
            authDomain: "reksoft-21-46uzyi.firebaseapp.com",
            projectId: "reksoft-21-46uzyi",
            storageBucket: "reksoft-21-46uzyi.appspot.com",
            messagingSenderId: "179260844620",
            appId: "1:179260844620:web:7247f16afcb158d6d322e9"));
  } else {
    await Firebase.initializeApp();
  }
}
