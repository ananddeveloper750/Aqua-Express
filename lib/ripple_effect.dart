import 'package:flutter/material.dart';

class RippleEffect extends StatefulWidget {
  const RippleEffect({super.key});

  @override
  State<RippleEffect> createState() => _RippleEffectState();
}

class _RippleEffectState extends State<RippleEffect>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _animationController;
  var listRadius = [250.0, 300.0, 350.0, 400.0, 450.0, 500.0, 550.0, 600.0];
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Effect"), backgroundColor: Colors.blue),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children:
              listRadius
                  .map(
                    (radius) => Container(
                      width: radius * _animation.value,
                      height: radius * _animation.value,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.withValues(
                          alpha: 0.8 - _animation.value,
                        ),
                      ),
                       child: Stack(
                         alignment: Alignment.center,
                         children:[ Image.asset(
                           "assets/images/playstore.png",
                          height: 250,
                           width: 250,
                           fit: BoxFit.fill,
                         ),
                       ]),
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
