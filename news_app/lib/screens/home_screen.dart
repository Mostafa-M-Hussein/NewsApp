import 'package:flutter/material.dart' ;
import 'package:news_app/shared_ui/navgation_drawer.dart' ;
import 'home_tabs/whatsnew.dart' ;
import 'home_tabs/popular.dart';
import 'home_tabs/favourites.dart' ;
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


enum PopOutMenu
{
  HELP ,
  ABOUT ,
  CONTAT ,
  SETTINGS ,

}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController _tabcontroller ;

  @override
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
        title:  Text ("Explore")  ,
        centerTitle:  false ,
        actions:  <Widget>
            [
              IconButton(icon : Icon ( Icons.search )  , onPressed: (){} ) ,
             _popOutMenu(context)  ,


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
        WhatsNew() ,
        Popular() ,
        favourit() ,
      ]   ,
      controller:  _tabcontroller  ,) ,

    );
  }

 Widget _popOutMenu  (BuildContext context )
 {
   return PopupMenuButton <PopOutMenu> (itemBuilder: (context)
   {
     return
       [
         PopupMenuItem <PopOutMenu>
           (
           value: PopOutMenu.ABOUT ,
           child: Text ( 'ABOUT') ,
         ) ,
         PopupMenuItem <PopOutMenu>
           (
           value: PopOutMenu.CONTAT ,
           child: Text ( "CONTAT ") ,
         ) ,
         PopupMenuItem <PopOutMenu>
           (
           value: PopOutMenu.HELP ,
           child: Text ( "HELP ") ,
         ) ,
         PopupMenuItem <PopOutMenu>
           (
           value: PopOutMenu.SETTINGS ,
           child: Text ( "SETTINGS ") ,
         ) ,

       ]  ;
   }   ,
        )  ;
 }



}




