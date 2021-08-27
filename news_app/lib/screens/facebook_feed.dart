import 'package:flutter/material.dart';
import 'package:news_app/models/post.dart';
import 'package:news_app/shared_ui/navgation_drawer.dart';
import 'package:news_app/api/posts_api.dart';
import 'package:news_app/utlities/data_utilites.dart';

class FacebookFeeds extends StatefulWidget {
  @override
  _FacebookFeedsState createState() => _FacebookFeedsState();
}

class _FacebookFeedsState extends State<FacebookFeeds> {
  List<int> ids = [];

  TextStyle _hashTagStyle = TextStyle(color: Colors.orange);

  @override
  void initState() {
    super.initState();
    ids = [0, 2, 5];
  }

  @override
  Widget build(BuildContext context) {
    PostsApi post = PostsApi();
    return Scaffold(
      appBar: AppBar(
        title: Text("Facebook Feeds"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      drawer: NavigationDrawer(),
      body: FutureBuilder(
        future: post.fetchPostsByCatergoryID('1'),
        builder: (context, AsyncSnapshot snapshot) {
          List<Post> posts = snapshot.data;
          Post post1 = posts[0];
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return loading();
              break;
            case ConnectionState.active:
              return loading();
              break;
            case ConnectionState.none:
              return connectionError();
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                return snapshot.error;
              } else {
                return (ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemBuilder: (context, position) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _drawHeader(post1, position),
                            _drawTitle(),
                            _drawHashTags(),
                            _drawBody(post1),
                            _drawFooter(),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: posts.length ,
                ));
              }
              break ;

          }
        },
      ),
    );
  }

  Widget _drawHeader(Post posts, int position) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: CircleAvatar(
                backgroundImage: NetworkImage(posts.featured_image),
                radius: 24,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "",
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  posts.title,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                setState(() {
                  if (ids.contains(position)) {
                    ids.remove(position);
                  } else {
                    ids.add(position);
                  }
                });
              },
              color:
                  (ids.contains(position)) ? Colors.red : Colors.grey.shade400,
            ),
            Transform.translate(
                offset: Offset(-12, 0),
                child: Text(
                  posts.votesUp,
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                )),
          ],
        ),
      ],
    );
  }

  Widget _drawTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
      child: Text(
        'We also talk about the future of work as the robots',
        style: TextStyle(color: Colors.grey.shade900),
      ),
    );
  }

  Widget _drawHashTags() {
    return Container(
      child: Wrap(
        children: <Widget>[
          FlatButton(
              onPressed: () {},
              child: Text(
                '#advance',
                style: _hashTagStyle,
              )),
          FlatButton(
              onPressed: () {},
              child: Text(
                '#advance',
                style: _hashTagStyle,
              )),
          FlatButton(
              onPressed: () {},
              child: Text(
                '#advance',
                style: _hashTagStyle,
              )),
        ],
      ),
    );
  }

  Widget _drawBody(Post posts) {
    return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.25,
        child: Image(
          image: NetworkImage(posts.featured_image),
          fit: BoxFit.cover,
        ));
  }

  Widget _drawFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
            onPressed: () {},
            child: Text(
              '10 COMMENTS',
              style: _hashTagStyle,
            )),
        Row(
          children: <Widget>[
            FlatButton(
                onPressed: () {},
                child: Text(
                  'SHARE',
                  style: _hashTagStyle,
                )),
            FlatButton(
                onPressed: () {},
                child: Text(
                  'OPEN',
                  style: _hashTagStyle,
                )),
          ],
        ),
      ],
    );
  }
}
