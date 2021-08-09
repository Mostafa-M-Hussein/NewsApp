import 'package:flutter/material.dart';

class Popular extends StatefulWidget {

  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: ( context , position ){

      return Card (
        child :_drawSingelRow () ,

      );
    },
      itemCount: 20,
    );
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
}
