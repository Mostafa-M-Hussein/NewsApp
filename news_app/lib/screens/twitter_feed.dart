import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:news_app/shared_ui/navgation_drawer.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Twitter Feed "),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemBuilder: ( context, position) {

          return Card(
            child : Column(
              children:
              [
                _cardHeader() ,

                _cardBody() ,
                _drawLine() ,
                _cardFooter()

              ],
            ),
          );
        },
        itemCount: 4,
      ),
    );
  }


Widget _cardHeader ()
{
  return Row
    (
    children: <Widget>
    [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: CircleAvatar(
          backgroundImage: ExactAssetImage ('assets/images/2.jpg' ) ,
          radius: 24 ,),
      ),
      Column(  crossAxisAlignment: CrossAxisAlignment.start , children:

      [
        Row ( children: [
          Text('Christina Meyers @ch_meyers',  style: TextStyle( color : Colors.black, fontWeight: FontWeight.w900 , fontSize: 16),)  ,
          SizedBox(width: 8,) ,
          Text ("@ch_meyers" , style: TextStyle( color : Colors.black, fontWeight: FontWeight.w600 )  )  ,

        ]   ),
        SizedBox(height: 8,),
        Text("Fri 12 , May ") ]) ,



    ],

  ) ;
}


Widget _cardBody (){
    return Padding
      (
      padding: EdgeInsets.all(16),
      child: Text("We also talk about Future of work as the robots advanced , and we ask wherter a retro phone " , style: TextStyle( color : Colors.grey, fontWeight: FontWeight.w900  ,fontSize: 16 ),),
    ) ;
}

Widget _cardFooter ()
{
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row
      (
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:
      [
       Row( children:
       [
         IconButton( onPressed: ( ){} , icon : Icon (Icons.repeat , color: Colors.red,)  ) ,
         Text ("25") ,

       ],),
        Row(children:
        [
          FlatButton(onPressed: () { },  child : Text ("SHARED " , style: TextStyle( color : Colors.red ),) ) ,
          FlatButton(onPressed: () { },  child : Text ("OPEN "  ,style: TextStyle( color : Colors.red ),)) ,

        ],) ,
      ],
    ),
  )  ;

}

Widget  _drawLine()
{
  return Container
    (
    height: 1,
    color :Colors.grey.shade500  ,
    margin: EdgeInsets.only(top :16 ),

  ) ;
}


}
