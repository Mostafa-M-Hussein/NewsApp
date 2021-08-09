import 'package:flutter/material.dart';
import '../message_provider.dart';
import '../conversion.dart';

class ConversaionList extends StatefulWidget {
  @override
  _ConversaionListState createState() => _ConversaionListState();
}

class _ConversaionListState extends State<ConversaionList> {
  List<List<Conversion>> converstions = [
    MessageProvide.geConversion(),
    MessageProvide.geConversion(),
    MessageProvide.geConversion(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        child: ListView.builder(
          itemCount: converstions.length,
          itemBuilder: (BuildContext context, int postion) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text( converstions[postion].first.messasge.last.dateTime , style: TextStyle(

                    color  : Colors.white ,
                    fontSize:18 ,
                    fontWeight: FontWeight.bold ,


                  ),),
                ),
            ... List.generate(converstions[postion].length, (index) {
            return Card(
            margin: EdgeInsets.all(17),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50) ),

            child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start ,

            children: [
            Container(
            margin: EdgeInsets.only(right: 24),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
            image: ExactAssetImage(converstions[postion][index]
                .users
                .last
                .avatar))),
            ),
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(converstions[postion][index].users.first.name  , style: TextStyle(

              fontWeight: FontWeight.w500 ,

            ),) ,
            SizedBox(height:5 ,) ,
            Text(converstions[postion][index].messasge.last.body , style: TextStyle(
              fontSize: 12 ,
              fontWeight: FontWeight.w300  ,

            ),) ,

            ],
            ),
            Spacer(flex: 1 ) ,
            Transform.translate(
            offset: Offset( -4 , -8 ),
            child: Text(converstions[postion][index].messasge.last.dateTime))
            ],
            ),
            ),
            );
            }).toList() ]


            );
          },
        ),
      ),
    );
  }
}
