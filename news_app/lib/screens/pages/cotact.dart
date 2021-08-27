import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController  ;
  TextEditingController emailController ;
  TextEditingController messageController ;


  @override
  void initState()
  {
    super.initState() ;
    nameController = TextEditingController( ) ;
    emailController = TextEditingController( ) ;
    messageController = TextEditingController( ) ;
  }
  @override
  void dispose ()
  {
    nameController.dispose() ;
    emailController.dispose() ;
    messageController.dispose()  ;
    super.dispose() ;
  }
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us "),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (isLoading) ? _loading() : _contactForm(),
      ),
    );
  }

  _contactForm() {
    return (Form(
      key: _formKey ,
      child: Column(
        children: [
          TextFormField(controller: nameController,

              decoration: InputDecoration(labelText: 'Your name '),
              validator: (value) {
                if (value.isEmpty) {
                  return "Plz Enter your name ";
                } else {
                  return null;
                }
              }),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Your email ",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return "Your Email ";
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: messageController,
            decoration: InputDecoration(
              labelText: "Message ",
            ),
            maxLines: 4,
            validator: (value) {
              if (value.isEmpty) {
                return "Enter your Message ";
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    //ToDo: Loading , send Message
                    String name = nameController.text ;
                    String email = emailController.text ;
                    String message = messageController.text ;

                    setState(() {
                      isLoading = true;
                    });
                  } else {
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                child: Text(
                  "Send Message ",
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ],
      ),
    ));
  }

  Widget _loading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
