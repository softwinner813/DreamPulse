import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAWjuyXbYKTwHxNW9NCskIH1FZAHgzbuOk",
            authDomain: "dreampulse-f2991.firebaseapp.com",
            projectId: "dreampulse-f2991",
            storageBucket: "dreampulse-f2991.appspot.com",
            messagingSenderId: "198535501146",
            // appId: "1:198535501146:web:d0ea68e4a8956f2b630f63",
            appId: "1:198535501146:ios:69878db2a71e0cc0630f63",
            measurementId: "G-T3YE30ZVJC"));
  } else {
    await Firebase.initializeApp();
  }
}
