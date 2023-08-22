
import '../models/repository_search_result.dart';
import '../models/users_search_result.dart';
import 'github_cache.dart';
import 'github_client.dart';

class GithubRepository {
  GithubRepository({required this.client, required this.cache});
  final GithubClient client;
  final GithubCache cache;

  Future<RepositorySearchResult> search(String query) async {
    final catchResult = cache.getCachedRepository(query);
    if (catchResult != null) {
      return catchResult;
    }
    final RepositorySearchResult result =
        await client.repositoriesSearch(query);
    cache.setRepository(query, result);
    return result;
  }

  Future<UsersSearchResult> usersSearch(String query) async {
    final catchResult = cache.getCachedUser(query);
    if (catchResult != null) {
      return catchResult;
    }
    final UsersSearchResult result = await client.usersSearch(query);
    cache.setUser(query, result);
    return result;
  }
}
