part of 'users_search_bloc.dart';

@immutable
sealed class UsersSearchEvent {}



final class DrawerChangeItem extends UsersSearchEvent {
  final int index;
  DrawerChangeItem({this.index = 0});
}
