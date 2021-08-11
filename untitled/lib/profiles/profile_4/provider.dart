import 'package:untitled/profiles/profile_4/profile.dart';

class ProfileProvide
{
  static Profile getProfile()
  {

    return Profile( user : User(name:  "Moado" , profession: "Eng" , about: "Hello man "),
        followers: 10,
        following: 20 ,
        friends:  30 ,
    )  ;
  }

}