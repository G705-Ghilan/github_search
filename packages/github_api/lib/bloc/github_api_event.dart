part of 'github_api_bloc.dart';

@immutable
sealed class GithubApiEvent {}

final class SearchForRepositories extends GithubApiEvent {
  final String query;
  SearchForRepositories({required this.query});
}

final class SearchForUsers extends GithubApiEvent {
  final String query;
  SearchForUsers({required this.query});
}
