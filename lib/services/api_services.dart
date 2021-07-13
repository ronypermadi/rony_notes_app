import 'dart:convert';

import 'package:rony_notes_app/models/posts.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<Posts>> getPosts() async {
    var url = Uri.parse('https://ronypermadi.com/api/post');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      // List<dynamic> body = jsonDecode(response.body);
      // List<Posts> posts =
      //     body.map((dynamic item) => Posts.fromJson(item)).toList();
      // return posts;
      return postFromJson(response.body);
    } else {
      return throw Exception('Failed to load a post');
    }
  }
}
