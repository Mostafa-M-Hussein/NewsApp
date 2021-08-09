import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class favourit extends StatefulWidget {
  @override
  _favouritState createState() => _favouritState();
}

class _favouritState extends State<favourit> {
  List<Color> colors = [
    Colors.red,
    Colors.transparent,
    Colors.deepOrange,
    Colors.orange,
  ];

  Color getRandomColor() {
    Random rand = Random();
    return (colors[rand.nextInt(colors.length)]);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, postion) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                _AuthorRow(),
                SizedBox(height: 10) ,
                _newsItemRow () ,
              ],
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }

  Widget _AuthorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: ExactAssetImage("assets/images/1.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mostafa Mahmoud ",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("18 min ", style: TextStyle(color: Colors.grey)),
                    Text("Lift Style ",
                        style: TextStyle(color: getRandomColor())),
                  ],
                )
              ],
            )
          ],
        ),
        IconButton(icon: Icon(Icons.bookmark_border), onPressed: () {}),
      ],
    );
  }

  Widget _newsItemRow() {
    return Row(
      children:
      [
        Container
          (
          width: 100,
          height: 100,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(image: DecorationImage (image: ExactAssetImage('assets/images/1.jpg') ,
            fit: BoxFit.cover ,

          )),
        ),
        Expanded(
          child: Column
            (
            children:
            [
              Text( "CustomPaint needs at least two properties:" , style: TextStyle(color: Colors.black , fontSize: 18),) ,
              Text( "painter, which paints before the children" , style: TextStyle(color: Colors.grey , height: 1.2) ) ,
              Text( "size, which specifies the canvas over which to draw the line" , style: TextStyle(color: Colors.grey ) ) ,
            ],
          ),
        )
      ],




    );
  }
}
