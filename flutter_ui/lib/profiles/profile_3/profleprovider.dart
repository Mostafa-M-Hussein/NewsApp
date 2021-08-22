import 'package:untitled/profiles/profile_3/profile.dart';



class ProfileProvider
{
  static Profile getProfile()
  {
    return Profile
      (
      user:User(name:"Miksa San " , address: "Besid Eren House " , about: "A template is a prebuilt project that offers everything you need for building your app – design resources, code samples, and more. Flutter templates can be used to kick-start a project with a variety of fully-functional screens and accompanying business logic. Flutter allows you to build beautiful apps on desktop, mobile, and web from a single codebase. So Flutter templates are not tied to any platform, they can be used with iOS, Android or web as desired."),
      followers: 2318 ,
      following:  231  ,
      friends: 1032,
      photos: 32


    )  ;

  }


}