


import '../models/repository_search_result.dart';
import '../models/users_search_result.dart';

class GithubCache {
  final Map<String, RepositorySearchResult> _catchedRepositories = {};
  final Map<String, UsersSearchResult> _catchedUsers = {};


  RepositorySearchResult? getCachedRepository(String query) => _catchedRepositories[query];
  UsersSearchResult? getCachedUser(String query) => _catchedUsers[query];

  setRepository(String query, RepositorySearchResult result) => _catchedRepositories[query] = result;
  setUser(String query, UsersSearchResult result) => _catchedUsers[query] = result;
}
