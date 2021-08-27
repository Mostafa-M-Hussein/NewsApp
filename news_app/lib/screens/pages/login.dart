import 'package:flutter/material.dart';
import 'package:news_app/api/authentication_api.dart';
import 'package:news_app/screens/home_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController ;
  TextEditingController _passwordController ;
  String username= null ;
  String password = null ;

  @override
  void intiState()
  {
    super.initState() ;
    _usernameController = TextEditingController(  ) ;
    _passwordController = TextEditingController(  ) ;
  }
   AuthenticationAPI authenticationAPI = AuthenticationAPI();

  bool isLoading = false  ;

  bool loginIsSucss = false;

  bool loginError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: (isLoading) ? _drawLoding() : _drawLoginForm(),
      ),
    );
  }

  Widget _drawLoginForm() {
    if (loginError)
    {
      return Container(
        child: Center(
          child: Container
            (
            child: Column
              (
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [
                Text("") ,
                RaisedButton(onPressed: ()
                {
                  setState(() {
                    loginError = false ;
                  });
                }  , child : Text("try agian " , style:  TextStyle
                  (
                  color : Colors.white  ,

                ) ,))  ,
              ],
            )
          ),
        ),
      );

    }
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: 48,
          ),
          TextFormField(
            controller: _usernameController,
            validator: (value) {
              if (value.isEmpty) {
                return "Plz Enter ur Username ";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(labelText: "username"),
          ),
          SizedBox(
            height: 48,
          ),
          TextFormField(
            controller: _passwordController ,
            validator: (value) {
              if (value.isEmpty) {
                return "Please entery ur password ";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          SizedBox(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.red,
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    // TODO : Call Api for Login
                    setState(() {
                      isLoading = false ;
                    });
                    username = _usernameController.text ;
                    password = _passwordController.text ;
                    print ( username ) ;
                    var response = await authenticationAPI.login(
                        username , password );
                    if (response) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomeScreen();
                      }));
                    } else {
                      loginError = true ;
                    }

                    setState(() {
                      isLoading = false;
                    });
                  } else {
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                child: Text(
                  "LOGIN ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _drawLoding() {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

