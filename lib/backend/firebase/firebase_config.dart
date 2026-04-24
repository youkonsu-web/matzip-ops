import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA3js2tt3yBmhEWkoAIlxSYqp2z8uqRsAE",
            authDomain: "matzip250424-i119eo.firebaseapp.com",
            projectId: "matzip250424-i119eo",
            storageBucket: "matzip250424-i119eo.firebasestorage.app",
            messagingSenderId: "513670228883",
            appId: "1:513670228883:web:74b296cf330adb69f15666"));
  } else {
    await Firebase.initializeApp();
  }
}
