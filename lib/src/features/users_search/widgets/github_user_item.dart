
import 'package:flutter/material.dart';
import 'package:github_api/github_api.dart';
class GithubUserItem extends StatelessWidget {
  const GithubUserItem({
    super.key,
    required this.user,
  });

  final GithubUser user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(10),
      minVerticalPadding: 0,
      leading: AnimatedSize(
        duration: const Duration(milliseconds: 100),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(user.avatarUrl),
        ),
      ),
      title: Text(user.name),
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        // RepositoryDialog.show(context, item);
      },
    );
  }
}
