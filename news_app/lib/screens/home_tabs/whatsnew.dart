import 'dart:math';
import 'package:news_app/screens/single_post.dart' ;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/posts_api.dart';
import 'package:news_app/models/post.dart';
import 'dart:async';
import 'package:news_app/utlities/data_utilites.dart';
import 'package:timeago/timeago.dart' as timeago;

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  PostsApi posts = PostsApi();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [drawHeader(), drawTopStories(), drawRecenctUpdate()],
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

    return FutureBuilder(
        future: posts.fetchPostsByCatergoryID("2"),
        builder: (context, AsyncSnapshot snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.waiting:
              return loading();
              break;

            case ConnectionState.active:
              return loading();
              break;
            case ConnectionState.done:
              if (snapShot.error != null) {
                return error(snapShot.error);
              } else {
                if (snapShot.hasData) {
                  List<Post> len = snapShot.data;
                  if (len.length > 3) {
                    Random random = Random();
                    int randomIndex = random.nextInt(len.length);
                    Post post = snapShot.data[randomIndex];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context  , MaterialPageRoute(builder:(context)
                        {
                            return SinglePost( post ) ;
                        } ) )   ;

                      }  ,
                      child: (Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * 0.50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(post.featured_image),
                                fit: BoxFit.cover)),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              post.title,
                              style: _headertitle,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8),
                            Text(post.content,
                                textAlign: TextAlign.center,
                                style: _headrDescription),
                          ],
                        )),
                      )),
                    );
                  } else {
                    return noData();
                  }
                } else {
                  return noData();
                }
              }

              break;
            case ConnectionState.none:
              return connectionError();

              break;
          }
        });
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
                child: FutureBuilder(
                  future: posts.fetchPostsByCatergoryID("2"),
                  builder: (context, AsyncSnapshot snapShot) {
                    switch (snapShot.connectionState) {
                      case ConnectionState.waiting:
                        return loading();
                        break;

                      case ConnectionState.active:
                        return loading();
                        break;
                      case ConnectionState.done:
                        if (snapShot.error != null) {
                          return error(snapShot.error);
                        } else {
                          if (snapShot.hasData) {
                            List<Post> len = snapShot.data;
                            if (len.length > 3) {
                              Post post1 = snapShot.data[0];
                              Post post2 = snapShot.data[1];
                              Post post3 = snapShot.data[2];
                              return (Column(
                                children: [
                                  _drawSingelRow(post1),
                                  _drwaDivider(),
                                  _drawSingelRow(post2),
                                  _drwaDivider(),
                                  _drawSingelRow(post3),
                                ],
                              ));
                            } else {
                              return noData();
                            }
                          } else {
                            return noData();
                          }
                        }

                        break;
                      case ConnectionState.none:
                        return connectionError();

                        break;
                    }
                  },
                ),
              ),
            ),
          ],
        ));
  }

  Widget drawRecenctUpdate() {
    return (Padding(
      padding: EdgeInsets.all(12),
      child: FutureBuilder(
        future: posts.fetchPostsByCatergoryID("1"),
        builder: (context, AsyncSnapshot snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.waiting:
              return loading();
              break;

            case ConnectionState.active:
              return loading();
              break;
            case ConnectionState.done:
              if (snapShot.error != null) {
                return error(snapShot.error);
              } else {
                if (snapShot.hasData) {
                  List<Post> len = snapShot.data;
                  if (len.length > 3) {
                    Post post1 = snapShot.data[2];
                    Post post2 = snapShot.data[3];
                    return (Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _drawtext("Recent Updates"),
                        _drwaRecentlyUpdateCard(post1),
                        _drwaRecentlyUpdateCard(post2),
                        SizedBox(
                          height: 25,
                          width: 100,
                        )
                      ],
                    ));
                  } else {
                    return noData();
                  }
                } else {
                  return noData();
                }
              }

              break;
            case ConnectionState.none:
              return connectionError();

              break;
          }
        },
      ),
    ));
  }

  Widget _drawSingelRow(Post post) {
    return GestureDetector(
      onTap:()
      {
        Navigator.push( context , MaterialPageRoute(builder: (context)
        {
          return SinglePost(post) ;
        })) ;
      } ,

      child: (Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                  post.featured_image,
                  fit: BoxFit.cover,
                ),
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
                        post.title,
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
                          Text(dateWritten(post.dateWritten)),
                        ]),
                  ],
                ),
              ),
            ],
          ))),
    );
  }

  Widget _drwaDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.shade200,
    );
  }

  Widget _drawtext(String s) {
    return Text(s,
        style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ));
  }

  Widget _drwaRecentlyUpdateCard(Post post) {
    return Card(
        child: GestureDetector(
          onTap:  (){
            Navigator.push(context ,   MaterialPageRoute(builder:  (context)
            {
              return SinglePost(post) ;
            } )) ;
          } ,
          child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(post.featured_image.toString()),
                    fit: BoxFit.cover)),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8, left: 16),
            child: Container(
                padding: EdgeInsets.only(left: 10, right: 15, top: 5, bottom: 4),
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "Sport",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                )),
          ),
          Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              child: Text(
                post.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )),
          Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              child: Row(
                children: [
                  Icon(Icons.timer, color: Colors.grey),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    dateWritten(post.dateWritten),
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ],
              ))
      ],
    ),
        ));
  }
}
