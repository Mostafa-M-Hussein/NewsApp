import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController _emailController = TextEditingController();
  Color _color = Color(0xfff7c41c);

  TextEditingController _passController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      child: Stack(children: [
        Image.asset(
          "assets/registration/darkbg1.jpg",
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text("Welcom Back",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 45)),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text("Sign in to your account ",
                    style: TextStyle(color: Colors.white)),
              ),
              SizedBox(
                height: 48,
              ),
              _from(context),
              Row(
                children: [
                  Text(
                    "Dont have ab account",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  FlatButton(onPressed: () {}, child: Text("Create one"))
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }

  var _key = GlobalKey<FormState>();

  Widget _from(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        margin: EdgeInsets.all(23),
        decoration: BoxDecoration(
          color: Color(0xFF121212),
          borderRadius: BorderRadius.all(Radius.circular(35)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Theme(
            data: ThemeData(
              primaryColor: Colors.white,
            ),
            child: Stack(
              children: [
                Form(
                  child: Column(
                    key: _key,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Your Email@address.com",
                          labelText: "email ",
                          hintStyle: TextStyle(color: Color(0xff6b6b6b)),
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 20),
                          focusColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: _passController,
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "***************",
                          labelText: "Password",
                          hintStyle: TextStyle(color: Color(0xff6b6b6b)),
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 20),
                          focusColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: InkWell(
                      onTap: () {},
                      child: Text("Forgot Password ! ",
                          style: TextStyle(
                            color: _color,
                          )),
                    )),
                Transform.translate(
                  offset: Offset(18, 18),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                        child: Container(
                      decoration: BoxDecoration(
                        color: _color,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            bottomLeft: Radius.circular(35),
                            bottomRight: Radius.circular(35)),
                      ),
                      width: 170,
                      height: 55,
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "LOGIN",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(Icons.arrow_forward, color: Colors.white),
                          ],
                        ),
                      ),
                    )),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
