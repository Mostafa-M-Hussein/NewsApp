import 'package:flutter/material.dart';
import 'package:news_app/screens/pages/cotact.dart';
import 'package:news_app/screens/facebook_feed.dart';
import 'package:news_app/screens/pages/help.dart';
import 'package:news_app/screens/pages/settings.dart';
import 'package:news_app/shared_ui/navgation_drawer.dart';
import 'home_tabs/whatsnew.dart';
import 'home_tabs/popular.dart';
import 'home_tabs/favourites.dart';
import 'package:news_app/api/authors_api.dart';
import 'package:news_app/screens/pages/about.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum PopOutMenu {
  HELP,
  ABOUT,
  CONTAT,
  SETTINGS,
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AuthorsAPI authorsAPI = new AuthorsAPI();

  TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    authorsAPI.fetchAllAuthors();

    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text("Explore"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          _popOutMenu(context),
        ],
        bottom: TabBar(
          tabs: [
            Tab(text: "What,s New "),
            Tab(text: "POPULAR"),
            Tab(text: "FAVOURITES"),
          ],
          controller: _tabcontroller,
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(
        children: [
          WhatsNew(),
          Popular(),
          favourit(),

        ],
        controller: _tabcontroller,
      ),
    );
  }

  Widget _popOutMenu(BuildContext context) {
    return PopupMenuButton<PopOutMenu>(
      onSelected: (PopOutMenu menu) {
        switch (menu) {
          case PopOutMenu.ABOUT:
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return AboutUs() ;
            } )) ;
            break;
          case PopOutMenu.CONTAT:
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return ContactUs() ;
            } )) ;
            break;
          case PopOutMenu.HELP:
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Help() ;
            } )) ;
            break;
          case PopOutMenu.SETTINGS:
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Settings() ;
            } )) ;
            break;
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.ABOUT,
            child: Text('ABOUT'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.CONTAT,
            child: Text("CONTAT "),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.HELP,
            child: Text("HELP "),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.SETTINGS,
            child: Text("SETTINGS "),
          ),
        ];
      },
    );
  }
}
