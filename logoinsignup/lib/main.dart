import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logoinsignup/loginpage.dart';
import 'package:logoinsignup/signuppage.dart';
import 'package:logoinsignup/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   
     options: FirebaseOptions(
      apiKey: "AIzaSyANH0W_2ICbHktuoRNYhTs53fOGC0xrxXA",
      appId: "1:981086320705:android:60b26e8e09ee6a8fd6aec0",
      messagingSenderId: "981086320705",
      projectId: "signup-a12ff",
      
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      onGenerateRoute: (settings) {
        if (settings.name == '/login') {
          return MaterialPageRoute(builder: (context) => LoginScreen());
        } else if (settings.name == '/signup') {
          return MaterialPageRoute(builder: (context) => SignupPage(emailFromWelcome: 'arishashahzad@Gmail.com',));
        }
        
      },
    );
  }
}
