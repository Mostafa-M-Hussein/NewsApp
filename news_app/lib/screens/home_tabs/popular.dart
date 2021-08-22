import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app/api/posts_api.dart';
import 'package:news_app/models/post.dart';
import 'package:news_app/screens/single_post.dart';
import 'package:news_app/utlities/data_utilites.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  PostsApi posts = PostsApi();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: posts.fetchPostsByCatergoryID("1"),
      builder: (context, AsyncSnapshot snapShot) {
        switch (snapShot.connectionState) {
          case ConnectionState.none:
            return connectionError();
            break;
          case ConnectionState.waiting:
            return loading();
            break;
          case ConnectionState.active:
            return loading();

            break;
          case ConnectionState.done:
            if (snapShot.hasError)
              return error(snapShot.error);
            else {
              List<Post> posts = snapShot.data ;


              return (ListView.builder(
                itemBuilder: (context, position) {
                  return Card(
                    child: _drawSingelRow(posts[position] ),
                  );
                },
                itemCount: posts.length ,
              ));
            }
            break;
        }
      },
    );
  }

  Widget _drawSingelRow(Post post) {
    return (Padding(
        padding: EdgeInsets.all(10),
        child: GestureDetector(
          onTap:()
          {
          Navigator.push(context, MaterialPageRoute(builder: (context)
          {
            return SinglePost(post);
          } )) ;
          } ,
          child: Row(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Image(
                    image: NetworkImage(post.featured_image ) ,
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
          ),
        )));
  }
}
