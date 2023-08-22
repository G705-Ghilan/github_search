import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:github_search/injection.dart';

import 'package:github_api/github_api.dart';

part 'repositories_search_event.dart';
part 'repositories_search_state.dart';

class RepositoreisSearchBloc extends Bloc<RepositoreisSearchEvent, RepositoreisSearchState> {
  bool isDark = false;

  RepositoreisSearchBloc() : super(RepositoreisSearchStateInitial()) {
  
    on<ChangeThemeEvent>(
      (event, emit) {
        emit(ThemeChangedState(mode: isDark ? 1 : 2));
        isDark = !isDark;
      },
    );
  }

}
