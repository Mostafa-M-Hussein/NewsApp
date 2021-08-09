import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navgation_drawer.dart';

import 'home_tabs/favourites.dart';
import 'home_tabs/popular.dart';
import 'home_tabs/whatsnew.dart';
class HeadLineNews extends StatefulWidget {

  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews> with TickerProviderStateMixin {
  TabController _tabcontroller ;

  void initState ()
  {
    super.initState() ;
    _tabcontroller = TabController ( initialIndex : 0  , length: 3  , vsync: this  ) ;


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      drawer: NavigationDrawer()  ,
      appBar:AppBar
        (
        title:  Text ("HeadLine news ")  ,
        centerTitle:  false ,
        actions:  <Widget>
        [
          IconButton(icon : Icon ( Icons.search )  , onPressed: (){} ) ,
          IconButton(icon : Icon ( Icons.more_vert )  , onPressed: (){} ) ,

        ] ,
        bottom:TabBar( tabs :
        [

          Tab(text : "What,s New ") ,
          Tab(text : "POPULAR") ,
          Tab(text : "FAVOURITES") ,

        ] ,
          controller :_tabcontroller  ,
          indicatorColor : Colors.white  ,
        ) ,


      )  ,
      body :TabBarView( children :
      [
        favourit() ,
        Popular() ,
        favourit() ,

      ]   ,
        controller:  _tabcontroller  ,) ,

    );
  }
}
