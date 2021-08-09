import 'package:flutter/cupertino.dart';
import 'user.dart' ;

class Profile1Provider
{

  static Profile getProfile ()
  {
    return  Profile(
        user : User (name : "Mostafa Mahmoud Hussein " , address : "17 Alex Street " , about: "Today I choose life. Every morning when I wake up I can choose joy, happiness, negativity, pain... To feel the freedom that comes from being able to continue to make mistakes and choices - today I choose to feel life, not to deny my humanity but embrace it"),
        followers  : 10 ,
        following : 20 ,
        friends : 220
    ) ;
  }




}