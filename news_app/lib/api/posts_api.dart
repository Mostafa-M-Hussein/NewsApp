import 'package:http/http.dart' as http;
import 'package:news_app/models/Category.dart';
import 'dart:convert';
import 'package:news_app/utlities/api_utilites.dart';
import 'package:news_app/models/post.dart';

class PostsApi {

  Future<List<Post>> fetchPostsByCatergoryID(String id ) async {
    List<Post> posts = List<Post>();
    var response = await http.get(Uri.parse(whats_new_api+id ));
    if (response.statusCode == 200) {
      Map<String, dynamic> JsonData = jsonDecode(response.body);
      var data = JsonData["data"];
      for (var item in data) {
         Post PostsData = new  Post(
            id: item['id'].toString(),
            title: item['title'].toString(),
            content: item['content'].toString(),
            dateWritten: item['date_written'].toString(),
            featured_image: item['featured_image'].toString(),
            votesUp: item['votes_up'].toString(),
            votesDown: item['votes_down'].toString(),
            votersUp: [item['voters_up']],
            votersDown: [item['voters_down']],
            userId: item['user_id'].toString(),
            categoryId: item['category_id'].toString());
          posts.add(PostsData);
      }
    }

    return posts;
  }



}
