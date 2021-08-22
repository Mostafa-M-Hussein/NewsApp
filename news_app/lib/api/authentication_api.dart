import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/utlities/api_utilites.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationAPI {
  Future<bool> login(String email, String password) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
    };
    Map<String, String> body = {
      "email": email,
      "password": password,
    };
    try {
      var respones = await http.post(
          Uri.parse(auth_api), headers: headers, body: body);
      if (respones.statusCode == 200) {
        var jsonData = jsonDecode(respones.body);
        var data = jsonData['data'];
        var token = data[1];
        print(token);
        SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
        sharedPreferences.setString('token', token);
        return true;
      }
    } catch (Exception) {
      return false;
    }
  }
}
