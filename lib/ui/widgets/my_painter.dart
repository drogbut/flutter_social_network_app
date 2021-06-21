import 'package:flutter/material.dart';
import 'dart:math';
import 'package:frontend_apps/ui/widgets/constants.dart';

/// How to draw and animate designs with Flutter CustomPaint Widget
class MyPainter extends CustomPainter {


  final PageController pageController;
   MyPainter(this.pageController): super(repaint: pageController);

  /// the origin (0, 0) is located at the top-left corner of the canvas
  @override
  void paint(Canvas canvas, Size size) {
    var painter = Paint()
    ..color = white
    ..style = PaintingStyle.fill;

    final radius = 25.0;
    final dy = 25.0;
    final dyCurrent = 25.0;
    final dyTarget = 125.0;
    final position = pageController.position;
    final extent = (position.maxScrollExtent-position.minScrollExtent+ position.viewportDimension);
    final offset = position.extentBefore/extent;
    bool toRight = dyCurrent < dyTarget;
    Offset entry = Offset(toRight ? dyCurrent : dyTarget, dy);
    Offset target = Offset(toRight ? dyTarget : dyCurrent, dy);
    Path path = Path();
    path.addArc(Rect.fromCircle(center: entry, radius: radius), 0.5 * pi, 1 * pi);
    path.addArc(Rect.fromCircle(center: target, radius: radius), 1.5 * pi, 1 * pi);
    path.addRect(Rect.fromLTRB(entry.dy, dy - radius, target.dx, dy + radius));
    canvas.translate(size.width*offset, 0.0);
    canvas.drawShadow(path, base, 2.5, true);
    canvas.drawPath(path, painter);

  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => true;


}