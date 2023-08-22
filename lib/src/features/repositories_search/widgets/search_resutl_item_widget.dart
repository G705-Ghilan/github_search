import 'package:flutter/material.dart';
import 'package:github_search/src/features/repositories_search/widgets/repository_dialog.dart';

import 'package:github_api/github_api.dart';
class SearchResultItemWidget extends StatelessWidget {
  const SearchResultItemWidget({super.key, required this.item});

  final SearchResultItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(10),
      minVerticalPadding: 0,
      leading: AnimatedSize(
        duration: const Duration(milliseconds: 100),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(item.owner.avatarUrl),
        ),
      ),
      title: Text(item.name),
      subtitle: Text(
        item.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        RepositoryDialog.show(context, item);
      },
    );
  }
}
