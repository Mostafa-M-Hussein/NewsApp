import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Registration5 extends StatefulWidget {
  @override
  _Registration5State createState() => _Registration5State();
}

class _Registration5State extends State<Registration5> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      child: Stack(
        children: [
          Image.asset(
            'assets/registration/waves_bg.jpg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ..._titles(context),
                Padding(
                  padding: const EdgeInsets.all(42),
                  child: Form(
                    child: Column(children: [..._form(context)]),
                  ),
                ),
                _notes(context),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _titles(BuildContext context) {
    return [
      Text(
        "Welcom Back ",
        style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2),
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Text(
              "Flutter",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xffeb4137),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: Text(
              "Marthon",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xffffa810),
              ),
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> _form(BuildContext context) {
    return [
      TextFormField(
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(color : Colors.white.withOpacity(0.1) ) ,
          hintText: "email@address.com",
          prefixStyle: TextStyle(color: Color(0xffeaf5f7)),
          prefixIcon: Icon(Icons.alternate_email, color: Colors.white),
          border: _inputBorder(),
          enabledBorder: _inputBorder(),
          disabledBorder: _inputBorder(),
          fillColor: Color(0xff181819),
          filled: true,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        style: TextStyle(
          color: Colors.white,
        ),
        obscureText: true,
        decoration: InputDecoration(
          prefixStyle: TextStyle(color: Color(0xffeaf5f7)),
          hintText: "password",
          hintStyle: TextStyle(color : Colors.white.withOpacity(0.1) ) ,

          prefixIcon: Icon(Icons.lock, color: Colors.white),
          border: _inputBorder(),
          enabledBorder: _inputBorder(),
          disabledBorder: _inputBorder(),
          fillColor: Color(0xff181819),
          filled: true,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Align(
        alignment: Alignment.center,
        child: Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
              color: Color(0xfffb5648),
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: InkWell(
            onTap: () {},
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "SIGN IN ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.8),
                )),
          ),
        ),
      ),
    ];
  }

  Widget _notes(BuildContext contex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Dont have an account  ? ",
          style: TextStyle(color: Colors.white),
        ),
        FlatButton(
          onPressed: () {},
          child: Text(
            "Create one ",
            style: TextStyle(
                color: Color(0xff2273d7),
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  OutlineInputBorder _inputBorder() {
    return (OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent, width: 0),
        borderRadius: BorderRadius.all(Radius.circular(50))));
  }
}

class Background extends CustomPainter {
  List<Color> color = [
    Color(0xffeb4317),
    Color(0xfff1a810),
    Color(0xff262628),
    Color(0xff2273d7)
  ];

  @override
  void paint(Canvas canvas, Size size) {
    _drawDarkBackground(canvas, size);
    _drawBlueCurves(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelagate) => false;

  void _drawDarkBackground(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = color[2];
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);
  }

  void _drawBlueCurves(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = color[3];
    Path path = Path();
    path.lineTo(0, size.height * 0.85);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.95,
        size.width * 0.25, size.height * 0.95);
    path.quadraticBezierTo(size.width * 0.35, size.height * 0.95,
        size.width * 0.35, size.height * 0.98);
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.9,
        size.width * 0.85, size.height * 0.96);
    path.quadraticBezierTo(
        size.width * 0.89, size.height * 0.96, size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    canvas.drawPath(path, paint);
  }
}
