import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Registration3 extends StatefulWidget {
  @override
  _Registration3State createState() => _Registration3State();
}

class _Registration3State extends State<Registration3> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      child: CustomPaint(
        painter: background(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Stack(
            children: [
              _title(context),
              _profileImage(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileImage(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.20,
      right: 0,
      left: 0,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.23,
        height: MediaQuery.of(context).size.height * 0.23,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 5),
            image: DecorationImage(
                image: ExactAssetImage("assets/shared/avatar.jpg")),
            shape: BoxShape.circle),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      right: 0,
      bottom: MediaQuery.of(context).size.height * 0.35,
      child: Column(
        children: [
          Text(
            "Welcom Back to ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          Text(
            "Book Stack ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.bold ,
            ),
          ),
        ],
      ),
    );
  }
}

class background extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Color(0xff06205d);
    canvas.drawPaint(paint);

    Paint paint2 = Paint();
    paint2.color = Color(0xffe45600);
    Path path2 = Path();
    path2.lineTo(0, 0);
    path2.lineTo(0, size.height * 0.3);
    path2.quadraticBezierTo(
        size.width * 0.5, size.height * 0.5, size.width, size.height * 0.3);
    path2.lineTo(size.width, 0);
    path2.lineTo(0, 0);
    path2.close();
    canvas.drawPath(path2, paint2);

    Path path1 = Path();
    path1.lineTo(0, 0);
    path1.lineTo(0, size.height * 0.12);
    path1.quadraticBezierTo(
        size.width * 0.5, size.height * 0.68, size.width, size.height * 0.12);
    path1.lineTo(size.width, 0);
    path1.lineTo(0, 0);
    path1.close();

    Gradient gradint1 = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xfffD8B32),
          Color(0xfff96213),
        ],
        stops: [
          0.0,
          0.4,
        ]);

    Rect rect1 = Rect.fromLTWH(0, 0, size.width, size.height);
    paint.shader = gradint1.createShader(rect1);
    canvas.drawPath(path1, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
