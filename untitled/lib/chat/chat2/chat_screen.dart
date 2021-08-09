import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/chat/chat1/conversion.dart';
import 'package:untitled/chat/chat1/message.dart';

class ChatScreen2 extends StatelessWidget {
  final _key = GlobalKey<FormState>();

  final TextEditingController _messageController = TextEditingController();

  final Conversion conversation;
  final String name;

  @override
  void dispose() {
    _messageController.dispose();
  }

  ChatScreen2(this.conversation, this.name);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xffef1385),
              Color(0xfff12180),
              Color(0xfff63d76),
              Color(0xFFf84f70),
            ], stops: [
              0.2,
              0.4,
              0.6,
              0.8
            ])),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Elise Remmi",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  size: 40,
                ),
                onPressed: () {},
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                ),
              ],
            ),
            body: Column(
              children: <Widget>[
                Flexible(
                  child: ListView.builder(
                    itemCount: this.conversation.messasge.length,
                    itemBuilder: (BuildContext context, int position) {
                      if (this.conversation.messasge[position].sender.name ==
                          this.name) {
                        return RightMessage(
                            this.conversation.messasge[position]);
                      } else {
                        return LeftMessage(
                            this.conversation.messasge[position]);
                      }
                    },
                  ),
                ),
                _sendMessage(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget RightMessage(Message message) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
              offset: Offset(32, 34),
              child: Text(
                message.dateTime,
                style: TextStyle(color: Colors.white, fontSize: 12),
              )),
          Row(
            children: [
              Spacer(
                flex: 1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    message.sender.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(message.sender.phone,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 10)),
                ],
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: ExactAssetImage(message.sender.avatar))),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 34),
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.white.withOpacity(0.1)),
            margin: EdgeInsets.all(10),
            child: Text(
              message.body,
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget LeftMessage(Message message) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: ExactAssetImage(message.reciver.avatar))),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.reciver.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(message.reciver.phone,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 10)),
                ],
              ),
              Spacer(
                flex: 1,
              ),
              Transform.translate(
                  offset: Offset(-32, 24),
                  child: Text(
                    message.dateTime,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 34),
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.white.withOpacity(0.1)),
            margin: EdgeInsets.all(10),
            child: Text(
              message.body,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sendMessage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24.0),
      child: Container(
        child: Form(
          key: _key,
          child: Stack(
            children: [
              TextFormField(
                controller: _messageController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    left: 30,
                  ),
                  hintText: 'Write Messsage .... ',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusColor: Colors.white,
                  labelStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              Transform.translate(
                offset:Offset(-8, 6 ) ,
                child: Align(
                  alignment: Alignment.centerRight,
                  child : InkWell(
                    onTap:(){} ,
                    child: Container
                      (
                      width: 35,
                      height: 35,

                      decoration: BoxDecoration(gradient: LinearGradient ( colors: [
                        Color(0xffef1385),
                        Color(0xfff12180),
                        Color(0xfff63d76),
                        Color(0xFFf84f70),
                      ], stops: [
                          0.2,
                          0.4,
                          0.6,
                          0.8 ]
                      ) , shape: BoxShape.circle ),
                      child: Icon(FontAwesomeIcons.paperPlane , size: 16 , color: Colors.white  ),
                    ) ,

                  ) ,




                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
