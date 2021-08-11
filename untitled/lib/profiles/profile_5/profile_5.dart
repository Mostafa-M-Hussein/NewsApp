import 'package:flutter/material.dart';
import 'profile.dart';

class Profile5 extends StatefulWidget {
  @override
  _Profile5State createState() => _Profile5State();
}

class _Profile5State extends State<Profile5>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  Profile _profile = ProfileProvider.profile();
  static Color _textColor = Color(0xFF4e4e4e);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: _textColor), onPressed: () {}),
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: _textColor,
              ),
              onPressed: () {}),
        ],
      ),
      body: _bodyContent(context),
    );
  }

  Widget _bodyContent(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _profileDetails(context),
          Flexible(child: _tabBarContent(context)),
        ],
      ),
    );
  }

  Widget _profileDetails(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: ExactAssetImage("assets/shared/avatar.jpg"),
            maxRadius: 90,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, top: 10),
            child: Text(
              _profile.user.name,
              style: TextStyle(
                color: _textColor,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _profile.user.profession,
              style: TextStyle(
                color: Colors.grey.shade500,
              ),
            ),
          ),
          _followButton(context),
        ],
      ),
    );
  }

  Widget _followButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: MaterialButton(
          elevation: 0,
          onPressed: () {},
          color: Colors.deepOrange,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 8),
            child: Text(
              "FOLLOW",
              style: TextStyle(color: Colors.white),
            ),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
        ),
      ),
    );
  }

  Widget _tabBarContent(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey.shade200),
                  bottom: BorderSide(color: Colors.grey.shade200),
                )),
            child: TabBar(
                unselectedLabelColor: Colors.grey.shade500,
                labelColor: Colors.grey.shade500,
                indicatorColor: Colors.grey.shade500,
                indicatorWeight: 5,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 25),
                controller: _tabController,
                tabs: [
                  Tab(text: "PHOTOS"),
                  Tab(text: "VIDEOS"),
                  Tab(text: "POSTS"),
                  Tab(text: "FRIENDS"),
                ]),
          ),
        ),
        Flexible(
          child: TabBarView(
            controller: _tabController,
            children: [
              _photos(context),
              _videos(context),
              _posts(context),
              _friends(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _photos(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        child: GridView.count(mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            crossAxisCount: 3,
            children: ProfileProvider.photos().map((photo) {
              return Container(
                  decoration: BoxDecoration(
                        shape:BoxShape.circle ,
                      image: DecorationImage(image: ExactAssetImage(photo) , ),


                 
                 
                  )
              );
            }).toList()),

      ),
    );
  }

  Widget _videos(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        child: GridView.count(mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            crossAxisCount: 3,
            children: ProfileProvider.videos().map((photo) {
              return Container(
                  decoration: BoxDecoration(
                    shape:BoxShape.circle ,
                    image: DecorationImage(image: ExactAssetImage(photo) , ),




                  )
              );
            }).toList()),

      ),
    );
  }

  Widget _friends(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        child: GridView.count(mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            crossAxisCount: 3,
            children: ProfileProvider.friends().map((photo) {
              return Container(
                  decoration: BoxDecoration(
                    shape:BoxShape.circle ,
                    image: DecorationImage(image: ExactAssetImage(photo) , ),




                  )
              );
            }).toList()),

      ),
    );
  }

  Widget _posts(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        child: GridView.count(mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            crossAxisCount: 3,
            children: ProfileProvider.posts().map((photo) {
              return Container(
                  decoration: BoxDecoration(
                    shape:BoxShape.circle ,
                    image: DecorationImage(image: ExactAssetImage(photo) , ),




                  )
              );
            }).toList()),

      ),
    );
  }
}
