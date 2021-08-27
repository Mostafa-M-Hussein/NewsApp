import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/nav_menu.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/headline_news.dart';
import 'package:news_app/screens/twitter_feed.dart';
import 'package:news_app/screens/instgram_feed.dart';
import 'package:news_app/screens/facebook_feed.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:news_app/utlities/api_utilites.dart';
import 'package:news_app/screens/pages/login.dart';


class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();

}

class _NavigationDrawerState extends State<NavigationDrawer> {
  bool isLoggedIn = false     ;
  String token  ;
  SharedPreferences sharedPreferences ;

  _checkToken() async
  {
    sharedPreferences = await  SharedPreferences.getInstance() ;

    setState(()  {

      token  = sharedPreferences.get('token') ;

      if ( token == null )
      {
        isLoggedIn = true  ;
      }else
      {
        isLoggedIn= false  ;
      }
    });

  }
   _logout ()
  {
      if ( sharedPreferences != null ) {
        sharedPreferences.remove('token');

        return HomeScreen();
      }

  }
  @override
  Widget build(BuildContext context) {

    if ( this.mounted ) {
      _checkToken();
    }
    List<NavMenuItem> navMenu = [
      NavMenuItem("Explore", () => HomeScreen()),
      NavMenuItem("HeadLines news ", () => HeadLineNews()),
      NavMenuItem("Twitter Feed ", () => TwitterFeed()),
      NavMenuItem("Instgram Feed ", () => InstgramFeed()),
      NavMenuItem("Facebook Feed ", () => FacebookFeeds()),
    ];



    @override
     initState()
    {
      super.initState() ;
      if ( isLoggedIn  )
      {
        navMenu.add( NavMenuItem( "Log out ", ()=> Login()) ) ;
      } else
      {
        navMenu.add( NavMenuItem( "Login", ()=> Login()) ) ;
      }
    }


    return Drawer(

        child: Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 25),
      child: ListView.builder(
        itemCount: navMenu.length,
        itemBuilder: (context, position) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: ListTile(
              title: Text(navMenu[position].title,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 22)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (contex) {
                    return navMenu[position].destination();
                  }),
                );
              },
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey.shade400,
              ),
            ),
          );
        },
      ),
    ));
  }
}
