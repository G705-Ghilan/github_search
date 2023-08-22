import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_api/github_api.dart';
import 'package:meta/meta.dart';

part 'github_api_event.dart';
part 'github_api_state.dart';

class GithubApiBloc extends Bloc<GithubApiEvent, GithubApiState> {
  final GithubRepository repository;

  GithubApiBloc({required this.repository}) : super(GithubApiInitial()) {
    on<SearchForRepositories>(repositoriesSearch);
    on<SearchForUsers>(usersSearch);
  }

  List<SearchResultItem>? repositories;
  List<GithubUser>? users;

  Future repositoriesSearch(SearchForRepositories event, emit) async {
    emit(SearchLoading());
    try {
      final RepositorySearchResult result =
          await repository.search(event.query);
      repositories = result.items;
      emit(RepositoriesSearchSuccess(items: result.items));
    } catch (e) {
      emit(SearchError(
          msg: e is SearchResutlError ? e.error : "Some thing went worng"));
    }
  }

  Future usersSearch(SearchForUsers event, emit) async {
    emit(SearchLoading());
    try {
      final UsersSearchResult result =
          await repository.usersSearch(event.query);
      users = result.items;
      emit(UsersSearchSuccess(items: result.items));
    } catch (e) {
      emit(SearchError(
          msg: e is SearchResutlError ? e.error : "Some thing went worng"));
    }
  }
}
