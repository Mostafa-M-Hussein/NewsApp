import 'dart:convert';
import 'package:http/http.dart' as http ;
import 'package:news_app/models/author.dart';
import 'package:news_app/utlities/api_utilites.dart';

class AuthorsAPI
{


    Future <List <Author> > fetchAllAuthors() async {
        List<Author> authors= List<Author>()  ;
        var response = await http.get(Uri.parse(all_authors_api) ) ;
        if (  response.statusCode == 200  ) {
            Map<String, dynamic> JsonData = jsonDecode(response.body );
            var data = JsonData["data"] ;
            for ( var item in data )
            {
                Author author = Author(item['id'].toString ()  , item['name'].toString() , item['email'].toString() ,item['avatar'].toString() ) ;
                authors.add(author) ;


            }



        }


    return authors;

    }

}