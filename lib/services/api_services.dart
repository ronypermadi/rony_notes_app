import 'dart:convert';

import 'package:rony_notes_app/models/posts.dart';
import 'package:rony_notes_app/models/category.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<Posts>> getPosts() async {
    var url = Uri.parse('https://ronypermadi.com/api/post');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return throw Exception('Failed to load all post');
    }
  }

  Future<Posts> getSinglePost(String slug) async {
    var url = Uri.parse('https://ronypermadi.com/api/post/$slug');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Posts.fromJson(data['data']);
    } else {
      return throw Exception('Failed to load single post');
    }
  }

  Future<List<Posts>> getPostCategory(String name) async {
    var url = Uri.parse('https://ronypermadi.com/api/category/$name');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return throw Exception('Failed to load post by category');
    }
  }

  Future<List<Posts>> getSearchPost(String search) async {
    var url = Uri.parse('https://ronypermadi.com/api/search/$search');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return throw Exception('Failed to load search post');
    }
  }

  Future<List<Category>> getCategory() async {
    var url = Uri.parse('https://ronypermadi.com/api/category');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return categoryFromJson(response.body);
    } else {
      return throw Exception('Failed to load category');
    }
  }
}
