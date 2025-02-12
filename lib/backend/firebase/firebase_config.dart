import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA0bgSN92bZwhebff9IAkNJz7TJBMu4_IA",
            authDomain: "to-do-gourza.firebaseapp.com",
            projectId: "to-do-gourza",
            storageBucket: "to-do-gourza.firebasestorage.app",
            messagingSenderId: "525980526659",
            appId: "1:525980526659:web:018c1050ba6691c18e8cf6"));
  } else {
    await Firebase.initializeApp();
  }
}
