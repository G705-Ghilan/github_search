



import 'search_result_item.dart';

class RepositorySearchResult {
  final List<SearchResultItem> items;
  RepositorySearchResult({required this.items});

  factory RepositorySearchResult.fromJson(Map<String, dynamic> json) {
    return RepositorySearchResult(
        items: (json["items"] as List<dynamic>)
            .map((e) => SearchResultItem.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}
