part of 'users_search_bloc.dart';

@immutable
sealed class UsersSearchState {}

final class UsersSearchInitial extends UsersSearchState {}

final class DrawerIndexChanged extends UsersSearchState {
  final int index;
  DrawerIndexChanged({required this.index});
}
