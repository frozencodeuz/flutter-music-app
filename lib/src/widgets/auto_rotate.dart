import 'dart:math' as Math;

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AutoRotate extends StatefulWidget {
  final Widget child;

  AutoRotate({@required this.child});

  @override
  _RotateState createState() => new _RotateState(child: child);
}

class _RotateState extends State<AutoRotate>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Widget child;

  _RotateState({@required this.child});

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 30),
      animationBehavior: AnimationBehavior.preserve,
    );

    animationController.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: new AnimatedBuilder(
        animation: animationController,
        child: child,
        builder: (BuildContext context, Widget _widget) {
          return new Transform.rotate(
            angle: animationController.value * Math.pi * 2,
            child: _widget,
          );
        },
      ),
    );
  }
}
