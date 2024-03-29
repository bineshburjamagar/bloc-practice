import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:counter_app/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostModel>> fetchPost() async {
    try {
      var res = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

      if (res.statusCode == 200) {
        final body = json.decode(res.body) as List;

        return body.map((e) {
          return PostModel(
              postId: e['postId'],
              id: e['id'],
              name: e['name'],
              email: e['email'],
              body: e['body']);
        }).toList();
      }
    } on SocketException catch (e) {
      throw Exception('$e');
    } on TimeoutException catch (e) {
      throw Exception("$e");
    }
    return [];
  }
}
