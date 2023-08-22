part of 'repositories_search_bloc.dart';

@immutable
sealed class RepositoreisSearchState {}


final class RepositoreisSearchStateInitial extends RepositoreisSearchState {}

final class ThemeChangedState extends RepositoreisSearchState {
  final int mode;
  ThemeChangedState({required this.mode});
}
