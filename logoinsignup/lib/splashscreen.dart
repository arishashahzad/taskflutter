import 'package:flutter/material.dart';
import 'package:logoinsignup/user_check.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // After animation completes, check user sign-in status
        UserSignInCheck().isSignedIn(context);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
              Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw2cYROzecXR6o0kU76yaqavlqcQ1HtHb1jtGE1DC55w&s",
                width: 400,
                height: 400,
              ),
              
              SizedBox(height: 20),
           
            
            ],
          ),
        ),
      ),
    );
  }
}
