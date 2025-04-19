import 'dart:async';
import 'package:aqua_express_cloth/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:aqua_express_cloth/BottomNavigationBar/bottom_navigation_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  final List<double> listRadius = [80, 150, 220, 300, 400, 500];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.easeOut)), weight: 70),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.8).chain(CurveTween(curve: Curves.easeIn)), weight: 30),
    ]).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    _animationController.forward();

    Timer(Duration(milliseconds: 3000), () {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbae1fa),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ...listRadius.map((radius) => AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: 1 - (_animation.value * 0.8), // ✅ Smooth fade effect
              child: Container(
                width: radius * _animation.value,
                height: radius * _animation.value,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withAlpha(
                      (255 * (1 - _animation.value * 0.8)).toInt()), // ✅ Smooth Alpha Effect
                ),
              ),
            )),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.shade300,
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Image.asset("assets/images/playstore.png", fit: BoxFit.contain),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
