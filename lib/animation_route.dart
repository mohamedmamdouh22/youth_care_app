import 'package:flutter/material.dart';

class SlideRight extends PageRouteBuilder {
  SlideRight({required this.Page})
      : super(
          pageBuilder: (context, animation, animationtwo) => Page,
          transitionsBuilder: (context, animation, animationtwo, child) {
            var begin =0.0;
            var end =1.0;
            var tween=Tween(begin:begin,end: end ,);
            final curvesAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
            return ScaleTransition(scale: tween.animate(curvesAnimation),child: child,);
          }
        );
  final Page;
}
