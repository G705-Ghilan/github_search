
import 'github_user.dart';

class SearchResultItem {
  final String name;
  final String fullName;
  final String url;
  final String description;
  final GithubUser owner;

  SearchResultItem(
      {required this.name,
      required this.fullName,
      required this.url,
      required this.description,
      required this.owner});

  factory SearchResultItem.fromJson(Map<String, dynamic> json) {
    return SearchResultItem(
        name: json["name"],
        fullName: json["full_name"],
        url: json["html_url"],
        description: json["description"] ?? json["full_name"],
        owner: GithubUser.fromJson(json["owner"]));
  }

  Uri get uri => Uri.parse(url);
}
