

import 'github_user.dart';

class UsersSearchResult {
  final List<GithubUser> items;
  UsersSearchResult({required this.items});

  factory UsersSearchResult.fromJson(Map<String, dynamic> json) {
    return UsersSearchResult(
        items: (json["items"] as List<dynamic>)
            .map((e) => GithubUser.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}
