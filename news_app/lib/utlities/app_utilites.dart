import 'package:shared_preferences/shared_preferences.dart';


Future <bool>  isLoggedIn()async
{
  SharedPreferences sharedpreferences = await SharedPreferences.getInstance() ;
  bool isLoggedIn = sharedpreferences.getBool('isloggedin' ) ;
  if ( isLoggedIn == null || isLoggedIn == false  )
  {
    return false  ;
  }

  return true  ;


}