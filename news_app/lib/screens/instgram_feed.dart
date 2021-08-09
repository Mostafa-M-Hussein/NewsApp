import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navgation_drawer.dart';


class InstgramFeed extends StatefulWidget {
  @override
  _InstgramFeedState createState() => _InstgramFeedState();
}

class _InstgramFeedState extends State<InstgramFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Instgram Feeds "),
          centerTitle: false,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print(" Who  am i ");
              },
            ),
          ],
        ),
        drawer: NavigationDrawer(),
        body: ListView.builder(
          itemBuilder: (context, position) {
            return Card(
                child: Column(
                  children: [
                    _drawHeadr(),
                    _drawHashtag(),
                    _drawBody(),
                    _drawFooter(),

                  ],
                ));
          },
          itemCount: 20,
          padding: EdgeInsets.all(10),
        ));
  }




  Widget _drawHeadr() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.purple,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mostafa Mahmoud  "),
                    SizedBox(width: 8),
                    Text("@gmail.com ", style: TextStyle(color: Colors.grey)),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Fri 12 may 2021 ",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 75.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(Icons.favorite),
                          onPressed: () {},
                          color: Colors.grey),
                      Transform.translate(
                          offset: Offset(-9, 0),
                          child:
                          Text("25", style: TextStyle(color: Colors.grey))),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }


  Widget _drawHashtag() {
    return (

        Container(
            margin: EdgeInsets.only(right : 70),
            child: Wrap(

              children: [
                FlatButton(
                    onPressed: () {},
                    child: Text("#Hashtag ",
                        style: TextStyle(color: Colors.orange.shade600))),
                FlatButton(
                    onPressed: () {},
                    child:
                    Text("#retro ",
                        style: TextStyle(color: Colors.orange.shade600))),
                FlatButton(
                    onPressed: () {},
                    child: Text("#instgram ",
                        style: TextStyle(color: Colors.orange.shade600))),
              ],
            )));
  }

  Widget _drawBody() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      child: (Image(
          image: ExactAssetImage("assets/images/1.jpg"), fit: BoxFit.cover)),
    );
  }

  Widget _drawFooter() {
    return
      (
          Row
            (
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              FlatButton(onPressed: () {}, child: Text("15 Comments " ,  style: TextStyle(color: Colors.orange.shade600))),
              Row
                (
                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                children:
                [
                  FlatButton(onPressed: () {}, child: Text("Share" ,  style: TextStyle(color: Colors.orange.shade600) )),
                  FlatButton(onPressed: () {}, child: Text("OPEN" ,  style: TextStyle(color: Colors.orange.shade600) )),


                ],
              )


            ],
          )
      );
  }


}