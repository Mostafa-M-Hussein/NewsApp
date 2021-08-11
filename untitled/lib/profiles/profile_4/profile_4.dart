import 'package:flutter/material.dart';
import 'package:untitled/profiles/profile_4/profile.dart';

import 'provider.dart';

class Profile4 extends StatefulWidget {
  @override
  _Profile4State createState() => _Profile4State();
}

class _Profile4State extends State<Profile4> {
  bool _visible=  false ;

  void initState()
  {
    super.initState() ;
    Future.delayed(Duration(milliseconds:500 ) , (){setState(() {
      _visible = true ;

    });}   ) ;
  }
  static Color _textColor = Color(0xFF4e4e4e);
  TextStyle _bottomBarTitle = TextStyle(
    color: Colors.grey.shade600,
  );
  TextStyle _bottomBarCounter = TextStyle(
    color: _textColor,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  Profile _profile = ProfileProvide.getProfile();

  @override
  Widget build(BuildContext context) {

    return Stack(

      children: [
        Image.asset(
          'assets/profiles/profile4bg.jpg',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              leading:
                  IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
              ]),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedOpacity(
                duration:Duration(milliseconds : 700 ) ,
                opacity: _visible ? 1 : 0 ,
                child: _bodyCard(context)),
          ),
        ),
      ],
    );
  }

  Widget _bodyCard(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      margin: EdgeInsets.symmetric(vertical: 34, horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start ,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _profileRow(context),
          ..._row2(context),
          Spacer(flex:2 ) ,

          _divider(context),
          _counters(context),
          _row3(context),
        ],
      ),
    );
  }

  Widget _counters(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'FOLLOWERS',
                style: _bottomBarTitle,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                _profile.followers.toString(),
                style: _bottomBarCounter,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                'FOLLOWING',
                style: _bottomBarTitle,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                _profile.following.toString(),
                style: _bottomBarCounter,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                'FRIENDS',
                style: _bottomBarTitle,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                _profile.following.toString(),
                style: _bottomBarCounter,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.grey.shade100,
    );
  }

  _profileRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
              backgroundImage: ExactAssetImage('assets/shared/avatar.jpg'),
              maxRadius: 40),
          Spacer( flex: 2 ) ,
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side: BorderSide(width: 1, color: Colors.grey)),
            elevation: 0,
            child: Text("Add Friend"),
            color: Colors.transparent,
            onPressed: () {},
          ),
          SizedBox(width: 16,) ,
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side: BorderSide(width: 1, color: Colors.grey)),
            elevation: 0,

            child: Text("FOLLOW" ,  style: TextStyle(color : Colors.white ) ,),
            color: Colors.grey,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

 List <Widget>  _row2(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(left : 16 , bottom: 16 ),
        child: Text(_profile.user.name ,
        style: TextStyle
          (
          fontWeight: FontWeight.w900  ,
          fontSize : 28 ,
          color : _textColor  ,

        ),),
      ) ,
      Padding(
        padding: const EdgeInsets.only(left : 16.0 , bottom: 16 ),
        child: Text(_profile.user.profession ,

        style: TextStyle
          (
              color : Colors.grey.shade800 ,
        ) ,),
      ) ,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal : 16.0),
        child: Text(_profile.user.about , style: TextStyle (color : Colors.grey.shade800  , fontSize : 18 , letterSpacing: 0.9 ) ,),
      )
    ]  ;
  }

  _row3(BuildContext context) {
    return Container();
  }
}
