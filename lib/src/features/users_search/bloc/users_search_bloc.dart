import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

part 'users_search_event.dart';
part 'users_search_state.dart';

class UsersSearchBloc extends Bloc<UsersSearchEvent, UsersSearchState> {
  int index = 0;
  UsersSearchBloc() : super(UsersSearchInitial()) {
    on<DrawerChangeItem>(changeIndex);
  }

  Future changeIndex(
      DrawerChangeItem event, Emitter<UsersSearchState> emit) async {
    index = event.index;
    emit(DrawerIndexChanged(index: event.index));
  }
}
