import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Registration2 extends StatefulWidget {
  @override
  _Registration2State createState() => _Registration2State();
}

class _Registration2State extends State<Registration2> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: GoogleFonts.montserrat().fontFamily),
      child: Stack(
        children: [
          Image.asset(
            'assets/registration/registration3.jpg',
            fit: BoxFit.cover,
          ),
          Opacity(
            opacity: 0.5,
            child: CustomPaint(
              painter: background1(),
              child: Container(),
            ),
          ),
          CustomPaint(
            painter: background2(
                LeftPoint: 0.35,
                RightPoint: 0.5,
                MidPoint1: 0.85,
                MidPoint2: 0.62),
            child: Container(),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Login to Start ! ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  _form(context),
                  SizedBox(
                    height: 48,
                  ),
                  _actions(context),
                  SizedBox(height: 30,) ,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _actions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: Text(
              "Forgot Password ? ",
              style: TextStyle(
                color: Color(0xfff9ea60),
                letterSpacing: 1.2,
              ),
            )),
        FlatButton(
            onPressed: () {},
            child: Text(
              "Sign Up ",
              style: TextStyle(
                color: Color(0xfff9ea60),
                letterSpacing: 1.2,
              ),
            ))
      ],
    );
  }

  Widget _form(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 250,
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: "Email ",
                      hintText: "Email",
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: "Password ",
                      hintText: "Password",
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, 50),
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xfff9c660),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "GO",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 29,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class background1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rec = Rect.fromLTWH(0, size.height * 0.35, size.width, size.height);
    Gradient gradient = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFF3181),
          Color(0xFFFA7537),
        ],
        stops: [
          0.8,
          0.5
        ]);
    Paint paint = Paint();
    paint.shader = gradient.createShader(rec);
    Path path = Path();
    path.lineTo(0, size.height * 0.25);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.44);
    path.lineTo(size.width * 0.85, size.height * 0.6);
    path.lineTo(0, size.height * 0.25);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class background2 extends CustomPainter {
  final double LeftPoint;

  final double RightPoint;

  final double MidPoint1;

  final double MidPoint2;

  background2(
      {this.LeftPoint, this.RightPoint, this.MidPoint1, this.MidPoint2});

  @override
  void paint(Canvas canvas, Size size) {
    Rect rec = Rect.fromLTWH(0, size.height * 0.35, size.width, size.height);
    Gradient gradient = LinearGradient(colors: [
      Color(0xFFFF3181),
      Color(0xFFFA7537),
    ], stops: [
      0.2,
      0.8
    ]);
    Paint paint = Paint();
    paint.shader = gradient.createShader(rec);
    Path path = Path();

    path.lineTo(0, size.height * LeftPoint);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * RightPoint);
    path.lineTo(size.width * MidPoint1, size.height * MidPoint2);
    path.lineTo(0, size.height * 0.35);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
