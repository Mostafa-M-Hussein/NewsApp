import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          drawHeader(),
          drawTopStories(),
        ],
      ),
    );
  }

  Widget drawHeader() {
    TextStyle _headertitle = TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    );
    TextStyle _headrDescription = TextStyle(
      color: Colors.white,
      fontSize: 18,
    );

    return (Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.50,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage("assets/images/1.jpg"),
              fit: BoxFit.cover)),
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Be yourself; everyone else is already taken",
                style: _headertitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                  "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe ― Albert Einstein",
                  textAlign: TextAlign.center,
                  style: _headrDescription),
            ],
          )),
    ));
  }

  Widget drawTopStories() {
    return Container(
        color: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12, left: 16),
              child: _drawtext("Top storeis"),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Card(
                child: Column(
                  children: [
                    _drawSingelRow(),
                    _drwaDivider(),
                    _drawSingelRow(),
                    _drwaDivider(),
                    _drawSingelRow(),
                    _drwaDivider(),
                    _drawSingelRow(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _drawtext("Recent Updates"),
                  _drwaRecentlyUpdateCard(),
                  _drwaRecentlyUpdateCard(),

                  SizedBox
                    (
                    height: 25,
                    width: 100,
                  )

                ],
              ),
            ),
          ],
        ));
  }

  Widget _drawSingelRow() {
    return (Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image(
                  image: ExactAssetImage("assets/images/1.jpg"),
                  fit: BoxFit.cover),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Look at my mother what she does while wake me up ",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 3,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.timer),
                        Text("15 min "),
                      ]),
                ],
              ),
            ),
          ],
        )));
  }

  Widget _drwaDivider()
  {
    return Container
      (
      height:  1 ,
      width: double.infinity ,
      color : Colors.grey.shade200 ,

    ) ;

  }

 Widget  _drawtext(String s)
 {
   return Text(
        s ,

     style:TextStyle
       (
       color : Colors.grey.shade700 ,
       fontWeight: FontWeight.w600 ,
       fontSize: 16 ,
     )

   );

 }

 Widget  _drwaRecentlyUpdateCard()
 {
   return Card
     (

     child : Column
       (
       crossAxisAlignment: CrossAxisAlignment.start,
       children:
       [
         Container
           (
           decoration: BoxDecoration ( image :DecorationImage (image : ExactAssetImage("assets/images/2.jpg") , fit: BoxFit.cover   ) ),
          width: double.infinity ,
           height:MediaQuery.of(context).size.height * 0.25  ,
         ) ,

         Padding(
           padding: const EdgeInsets.only(top : 16.0 , bottom  : 8 , left: 16 ),
           child: Container (
             padding : EdgeInsets.only( left : 10 ,right:  15 , top : 5 , bottom:   4  ) ,
             decoration:  BoxDecoration ( color : Colors.deepOrange , borderRadius:  BorderRadius.circular(8 ) ),



             child : Text( "Sport" , style: TextStyle
               (
               fontWeight:  FontWeight.w500 ,
               color :Colors.white ,
             ),)

           ),
         ) ,
         Padding(
           padding:  EdgeInsets.only ( left  : 16 ,right:  16  ,top :  8 , bottom:  8  ),
           child :Text ( "Veetel is Ferrai Number ONe _ Moado "  ,style:  TextStyle ( fontSize : 18 , fontWeight: FontWeight.w600 ),)
         ) ,
          Padding(padding: EdgeInsets.only(left  : 16 ,right:  16  ,top :  8 , bottom:  8 ) ,

            child :Row (
            children:
            [
              Icon(Icons.timer  ,color : Colors.grey ) ,
              SizedBox(width: 8,) ,
              Text("15 min " ,style: TextStyle ( color : Colors.grey , fontSize: 18 ),) ,

            ],
            )


          )
       ],

     )
   ) ;

 }

}
