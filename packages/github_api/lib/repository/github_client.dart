import "dart:convert";

import "package:http/http.dart" as http;

import "../models/repository_search_result.dart";
import '../models/search_result_error.dart';
import "../models/users_search_result.dart";


class GithubClient {
  static const String baseUrl = "https://api.github.com/";

  Future<RepositorySearchResult> repositoriesSearch(String query) async {
    final http.Response response =
        await http.get(Uri.parse("${baseUrl}search/repositories?q=$query"));

    final results = json.decode(response.body);

    if (response.statusCode == 200) {
      return RepositorySearchResult.fromJson(results);
    } else {
      throw SearchResutlError(
          error: results["message"] ?? "some thing went worng");
    }
  }

  Future<UsersSearchResult> usersSearch(String query) async {
    final http.Response response =
        await http.get(Uri.parse("${baseUrl}search/users?q=$query"));

    final results = json.decode(response.body);

    if (response.statusCode == 200) {
      return UsersSearchResult.fromJson(results);
    } else {
      throw SearchResutlError(
          error: results["message"] ?? "some thing went worng");
    }
  }
}
