import 'package:flutter/material.dart';
import 'package:untitled/chat/chat1/message_provider.dart';
import 'profiles/profile_1/profile_1.dart';
import 'profiles/profile_2/profile_2.dart';
import 'profiles/profile_3/profile_3.dart';
import 'profiles/profile_4/profile_4.dart';
import 'profiles/profile_5/profile_5.dart';
import 'chat/chat1/chat_list.dart';
import 'chat/chat2/chat_screen.dart';  //ChatScreen2(  MessageProvide.getConverasion()  , "Mostafa Mahmoud" ),
import 'registration/registration.dart';
import 'registration/registration1.dart';
main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Registration1() ,

    );
  }
}

