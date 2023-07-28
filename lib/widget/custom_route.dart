import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  CustomPageRoute({required this.child})
      : super(
        transitionDuration: const Duration(seconds: 4),
        pageBuilder: (context, animation, secondaryAnimation) => child);

  Widget buildTranstions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      ScaleTransition( 
        scale: animation,
        child: child);
}
