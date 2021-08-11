import 'profile.dart';


class ProfileProvider
{

  static Profile getProfile()
  {
      return Profile
        (
        user: User (
        name : "Eren Yeager " ,
        addres:  "667 adame ByPass"  ,
        about:  """You cannot control everything that happens to you; you can only control the way you respond to what happens. In your response is your power.” — Anonymous
         """,
        ), following: 365 , followers:  2023 , freinds: 52

      ) ;
  }
}