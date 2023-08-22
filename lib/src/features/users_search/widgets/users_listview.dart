import 'package:flutter/material.dart';
import 'package:github_search/src/features/users_search/widgets/github_user_item.dart';
import 'package:github_api/github_api.dart';
class UsersListView extends StatelessWidget {
  const UsersListView({
    super.key,
    required this.users,
  });
  final List<GithubUser> users;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ListView.builder(
        itemCount: users.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GithubUserItem(user: users[index]);
        },
      ),
    );
  }
}
