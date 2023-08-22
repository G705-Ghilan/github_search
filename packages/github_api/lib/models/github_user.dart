class GithubUser {
  final String avatarUrl;
  final String name;

  GithubUser({required this.avatarUrl, required this.name});

  factory GithubUser.fromJson(Map<String, dynamic> json) {
    return GithubUser(avatarUrl: json["avatar_url"], name: json["login"]);
  }
}
