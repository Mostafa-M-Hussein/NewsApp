import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/profiles/profile_3/profile.dart';
import 'profleprovider.dart';

class Profile3 extends StatefulWidget {
  @override
  _Profile3State createState() => _Profile3State();
}

class _Profile3State extends State<Profile3> {
  Profile _profile = ProfileProvider.getProfile();
  static Color _textColor = Color(0xFF4e4e4e);
  bool _visible = false ;
  void initState()
  {
    super.initState()  ;
    Future.delayed(Duration( milliseconds : 500 )  , ()=> _visible = true ) ;
  }

  TextStyle _bottomBarTitle = TextStyle(
    color: Colors.grey.shade600,
  );
  TextStyle _bottomBarCounter = TextStyle(
    color: _textColor,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/profiles/profile3bg.jpg",
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
          ),
          body: Stack(
            children: [
              _bodyContent(context),
              _profileImage(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bodyContent(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.07,
        left: 16,
        right: 16,
        bottom: 0,
        child: Container(
          padding: EdgeInsets.only(top: 75),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.white),
          child: ListView(
            children: [
              Text(
                _profile.user.name,
                style: TextStyle(
                    fontSize: 28,
                    color: _textColor,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _profile.user.address,
                  style: TextStyle(
                      fontSize: 16,
                      color: _textColor,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: _followButton(context),
              ),
              _divider(context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _counters(context),
              ),
              _divider(context),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "PHOTOS ${_profile.photos.toString()}",
                  style:
                      TextStyle(color: _textColor, fontWeight: FontWeight.bold),
                ),
              ),
              _photos(context),
              ..._aboutMe(context) ,
              _freinds(context ) ,
              _contacts(context) ,

            ],
          ),
        ));
  }

  Widget _profileImage(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width / 2 - 50,
      top: MediaQuery.of(context).size.height * 0.07 - 50,
      child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: ExactAssetImage("assets/shared/c1.jpg"),
                fit: BoxFit.cover,
              ))),
    );
  }

  Widget _followButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: MaterialButton(
        onPressed: () {},
        color: Colors.red.shade400,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 8),
          child: Text(
            "FOLLOW",
            style: TextStyle(color: Colors.grey.shade400),
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.grey.shade500,
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

  Widget _photos(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: ListView(
          padding: EdgeInsets.all(10),
          scrollDirection: Axis.horizontal,
          children: List.generate(_profile.photos, (index) {
            return Container(
              margin: EdgeInsets.all(16),
              width: 125,
              height: 125,
              decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: ExactAssetImage('assets/profiles/landscape_1.jpg'),
                      fit: BoxFit.cover)),
            );
          }).toList()),
    );
  }
  List<Widget> _aboutMe(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 17),
        child: Text(
          "ABOUT ME ",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: _textColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          _profile.user.about,
          style: TextStyle(
            color: _textColor,
            fontSize: 18,
            height: 1.4,
            letterSpacing: 1.2,
          ),
        ),
      ),
    ];
  }
  Widget  _freinds(BuildContext cotext) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        "FRIENDS  ${_profile.friends.toString()}  ",
        style: TextStyle(
            color: _textColor, fontSize: 16, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _contacts(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16),
      width: MediaQuery.of(context).size.width ,
      height: 90,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(25, (index) {
            return Container(
              width: 100,
              margin: EdgeInsets.only(right: 25 ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: ExactAssetImage(
                      'assets/shared/bg.jpg',
                    ),
                    fit: BoxFit.cover,
                  )),
            );
          })),
    );
  }
}
