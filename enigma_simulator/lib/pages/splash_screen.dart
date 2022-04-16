import 'package:enigma_simulator/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:enigma_simulator/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Home())));
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    final _curvedAnimation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInExpo,
      reverseCurve: Curves.easeInQuad, //easinOut
    );
    _animationController!.forward();
    _animation = Tween<double>(begin: 0.7, end: 0.8).animate(_curvedAnimation)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController!.forward();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80),
        color: myGrey,
        child: Transform.scale(
          scale: _animation!.value,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController!.dispose();
    super.dispose();
  }
}
