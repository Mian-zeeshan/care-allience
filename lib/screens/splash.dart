import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
    _animationController.reset();
    _animationController.forward();
    Timer(const Duration(seconds: 2), () async {
      Get.off(() {
        return const Home();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff0d0908),
      child: FadeTransition(
          opacity: _animation,
          child: Center(
            child: Image.asset(
              "assets/images/icon.png",
              alignment: Alignment.center,
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          )),
    );
  }
}
