import 'package:http/http.dart' as http;
import 'package:news_app/models/Category.dart';
import 'dart:convert';
import 'package:news_app/utlities/api_utilites.dart';

class CategoriesAPi {
  Future<List<Category>> fetchCategories() async {
    List<Category> categories = List<Category>();
    var response = await http.get(Uri.parse(all_categories));
    if (response.statusCode == 200) {
      print("yes");
      Map<String, dynamic> JsonData = jsonDecode(response.body);
      var data = JsonData["data"];
      for (var item in data) {
        Category CategoryData =
            Category(item['id'].toString(), item['title'].toString());
        categories.add(CategoryData);
      }
    }

    return categories;
  }
}
