import 'package:flutter/material.dart';
import 'package:untitled/registration/registration3.dart';

class Registration4 extends StatefulWidget {
  @override
  _Registration4State createState() => _Registration4State();
}

class _Registration4State extends State<Registration4> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: Background(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Container(),
        ));
  }
}

class Background extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Gradient gradient3 = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xffe6186e),
        Color(0xffff65a5),
      ],
      stops: [0.0, 0.8],
    );
    Rect rect3 = Rect.fromLTWH(0, 0, size.width, size.height);
    Paint paint3 = Paint();
    paint3.shader = gradient3.createShader(rect3);
    canvas.drawCircle(
        Offset(size.width - (size.width * 0.1), size.height * 0.10),
        500,
        paint3);

    Gradient gradient2 = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xffff8a64),
        Color(0xffff65a5),
      ],
      stops: [0.0, 0.2],
    );
    Rect rect2 = Rect.fromLTWH(0, 0, size.width, size.height);
    Paint paint2 = Paint();
    paint2.shader = gradient2.createShader(rect2);
    canvas.drawCircle(
        Offset(size.width - (size.width * 0.10), size.height * 0.10),
        300,
        paint2);
    Rect rectt2 = Rect.fromCircle(
        center: Offset(size.width - (size.width * 0.10), size.height * 0.10),
        radius: 300);

    Path path2 = Path();
    path2.addOval(rectt2);
    canvas.drawShadow(path2, Colors.black.withOpacity(0.4), 6, true);
    canvas.drawCircle(
        Offset(size.width - (size.width * 0.10), size.height * 0.10),
        150,
        paint2);

    Gradient gradient = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xfff84a64),
        Color(0xffff65a5),
      ],
      stops: [0.0, 0.8],
    );
    Rect rect1 = Rect.fromLTWH(0, 0, size.width, size.height);
    Paint paint1 = Paint();
    paint1.shader = gradient.createShader(rect1);
    Offset offset1 =
        Offset(size.width - (size.width * 0.10), size.height * 0.10);
    Offset offset2 =
        Offset(size.width - (size.width * 0.10) - 2, size.height * 0.10 - 3);
    Rect rect = Rect.fromCircle(center: offset1, radius: 155);
    Path path = Path();
    path.addOval(rect);
    canvas.drawShadow(path, Colors.black.withOpacity(0.5), 6, true);
    canvas.drawCircle(offset2, 150, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
