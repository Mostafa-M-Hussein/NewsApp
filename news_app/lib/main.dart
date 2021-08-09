import 'package:flutter/material.dart';
import 'screens/onboarding.dart' ;
import 'them_data.dart' ;
import 'screens/home_screen.dart' ;
import 'package:shared_preferences/shared_preferences.dart' ;
 main()   {




  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner : false ,
      title: 'Flutter Demo',
      theme:AppThem.appThem  ,
       home : OnBoarding() ,

    );
  }
}





