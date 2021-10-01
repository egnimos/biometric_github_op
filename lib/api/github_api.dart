import 'dart:io';
import 'dart:convert';

import 'package:fingerprint_auth_example/model/repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class GithubAPI with ChangeNotifier {

  //getRepos
  Future<List<Repo>> getRepos(int lastPageKey, int pageSize) async {
    final uri = "https://api.github.com/users/JakeWharton/repos?page=$lastPageKey&per_page=$pageSize";

    final client = http.Client();
    try {
      final response = await client.get(Uri.parse(uri));

      final msg = json.decode(response.body);

      //check the status
      if (response.statusCode >= 400) {
        throw Exception(msg["message"]);
      }

      List<Repo> result = [];
      List<dynamic> dataBaseResult = msg;

      dataBaseResult.forEach((r) {
        Repo repo = Repo.fromJson(r);
        result.add(repo);
      });

      return result;

    } on SocketException {
      throw Exception("check your internet connection");
    } catch (e) {
      throw e;
    } finally {
      //close the client
      client.close();
    }
  }
}
