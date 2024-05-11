

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logoinsignup/loginpage.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> checkUser() async {
    try {
      final user = await FirebaseAuth.instance
          .fetchSignInMethodsForEmail(_emailController.text);

      if (user.isNotEmpty) {
        // If email is valid, navigate to the login page
        Navigator.pushNamed(context, '/login');
      } else {
        // If email is not valid, navigate to the signup page
        Navigator.pushNamed(context, '/signup');
      }
    } catch (e) {
      // Handle error
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
         

          Image.network(
            'https://images.pexels.com/photos/250591/pexels-photo-250591.jpeg?auto=compress&cs=tinysrgb&w=600',
            fit: BoxFit.cover,
          ),
         Positioned(
  
  bottom: 5,
            left: 0,
            right: 0,
  child: Container(
    color: Colors.black.withOpacity(0.4),
    width: MediaQuery.of(context).size.width, // Adjusted to match screen width
    height: MediaQuery.of(context).size.height * 0.4, // Adjusted to cover 40% of the screen height
  ),
),
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Positioned(
            top: 50,
            left: 20,
            right: 0,
            child: Text(
              'WELCOME',
              textAlign: TextAlign.start, 
              style: TextStyle(
                color: Colors.white, 
                fontSize: 24,
              ),
            ),
          ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.3),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
    ElevatedButton(
  onPressed: () {
    if (_formKey.currentState!.validate()) {
     
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen()
        ),
      );
    }
  },
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Text('Continue', style: TextStyle(color: Colors.white)),
  ),
  style: ElevatedButton.styleFrom(
    primary: Colors.blue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
),


                      SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.facebook, color: Colors.blue),
                        label: Text('Continue with Facebook', style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[350],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.g_translate, color: Colors.blue),
                        label: Text('Continue with Google', style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[350],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.apple, color: Colors.blue),
                        label: Text('Continue with Apple', style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[350],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          "Don't have an account? Sign up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        'Forgot your password?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
