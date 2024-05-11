import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logoinsignup/loginpage.dart';
import 'package:logoinsignup/signuppage.dart';
import 'package:logoinsignup/welcomepage.dart';

class UserSignInCheck{

  FirebaseAuth _auth = FirebaseAuth.instance;

  isSignedIn(BuildContext context){

    if(_auth.currentUser == null){

      Timer(Duration(seconds: 5), ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) =>WelcomePage(),))  );

    }else{

      // Timer(Duration(seconds: 5), ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) =>LoginPage(),))  );


    }


  }





}