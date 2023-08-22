import 'package:flutter/material.dart';
import 'package:github_search/src/features/repositories_search/widgets/search_resutl_item_widget.dart';

import 'package:github_api/github_api.dart';
class SearchResultList extends StatelessWidget {
  const SearchResultList({
    super.key,
    required this.items,
  });
  final List<SearchResultItem> items;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ListView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SearchResultItemWidget(item: items[index]);
        },
      ),
    );
  }
}
