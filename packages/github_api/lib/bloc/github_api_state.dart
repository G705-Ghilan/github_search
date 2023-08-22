part of 'github_api_bloc.dart';

@immutable
sealed class GithubApiState {}

final class GithubApiInitial extends GithubApiState {}

final class RepositoriesSearchSuccess extends GithubApiState {
  List<SearchResultItem> items;
  RepositoriesSearchSuccess({required this.items});
}

final class EmptyState extends GithubApiState {}

final class SearchLoading extends GithubApiState {}

final class UsersSearchSuccess extends GithubApiState {
  final List<GithubUser> items;
  UsersSearchSuccess({required this.items});
}

final class SearchError extends GithubApiState {
  final String msg;
  SearchError({required this.msg});
}
