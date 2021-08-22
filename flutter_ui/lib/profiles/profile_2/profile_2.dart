import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/profiles/profile_2/provider.dart';
import 'profile.dart';

class Profile2 extends StatefulWidget {
  @override
  _Profile2State createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  static Color _textColor = Color(0xFF4e4e4e);
  bool _visible = false;
  bool _visible2 = false ;

  void initState()
  {
    super.initState()  ;
    Future.delayed(Duration(milliseconds : 500 ) , ()
    {
      _visible = true ;

    }).then((value) => _visible2 = true ) ;



  }

  TextStyle _bottomBarTitle = TextStyle(
    color: Colors.grey.shade600,
  );
  TextStyle _bottomBarCounter = TextStyle(
    color: _textColor,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  Profile _profile = ProfileProvider.getProfile();




  @override
  Widget build(BuildContext context) {

    return Theme(
      data: ThemeData(
        fontFamily: "SFDisplay",
      ),
      child: Stack(
        children: [
          Image.asset(
            "assets/profiles/profile2bg.jpg",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.45,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.bars),
              ),
            ),
            body: Stack(
              children: [
                _profileTitle(context),
                _bodyContent(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _profileTitle(BuildContext context) {
    return Positioned(
        top: 15,
        left: 0,
        right: 0,
        bottom: 0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 135,
                    height: 135,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        shape: BoxShape.circle),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 145,
                    height: 145,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        shape: BoxShape.circle),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        shape: BoxShape.circle),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 500  )  ,
                    opacity: _visible ? 1 :  0 ,
                    child: CircleAvatar(
                        backgroundImage:
                            ExactAssetImage("assets/shared/206418.jpg"),
                        maxRadius: 60),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                _profile.user.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.4),
              ),
            ),
            Text(_profile.user.addres,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                )),
          ],
        ));
  }

  Widget _bodyContent(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.3,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
          width: 500,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _counters(context),
              _divider(context),
              ..._aboutMe(context),
              _freinds(context),
              SizedBox(
                height: 30,
              ),
              _contacts(context),
            ],
          )),
    );
  }

  Widget _counters(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 400 ),
        opacity: _visible2  ? 1 : 0 ,
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
                  _profile.freinds.toString(),
                  style: _bottomBarCounter,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
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

  Widget _freinds(BuildContext cotext) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        "FRIENDS  ${_profile.freinds.toString()}  ",
        style: TextStyle(
            color: _textColor, fontSize: 16, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _contacts(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16),
      width: MediaQuery.of(context).size.width,
      height: 90,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(25, (index) {
            return Container(
              width: 100,
              margin: EdgeInsets.only(right: 25),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: ExactAssetImage(
                      'assets/shared/211600.png',
                    ),
                    fit: BoxFit.cover,
                  )),
            );
          })),
    );
  }
}
