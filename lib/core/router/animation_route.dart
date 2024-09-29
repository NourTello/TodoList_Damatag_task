import 'package:flutter/material.dart';

class MyAnimatedRoute extends PageRouteBuilder {
  final page;
  MyAnimatedRoute({required this.page}):super(
      pageBuilder : (context, animation,animationWidget) =>page,
      transitionsBuilder: (context, animation,animationWidget,child) {
        var begin = Offset(1, 0);
        var end = Offset(0, 0);
        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation,child: child,);
        //2
        // var begin = 0.0;
        // var end = 1.0;
        // var tween = Tween(begin: begin, end: end);
        // var curveAnimation = CurvedAnimation(parent: animation, curve: Curves.easeOutQuart);
        // return ScaleTransition(scale: tween.animate(curveAnimation),child: child,);
        // 3
        // var begin = 0.0;
        // var end =1.0;
        // var tween = Tween(begin: begin, end: end);
        // var curveAnimation = CurvedAnimation(parent: animation, curve: Curves.linearToEaseOut);
        // return RotationTransition(turns: tween.animate(curveAnimation),child: child,);
        //4
        // return Align(alignment: Alignment.centerLeft,child: SizeTransition(sizeFactor: animation,child: child,),);
     //5
     //    return FadeTransition(opacity: animation, child: child,);
      });
}