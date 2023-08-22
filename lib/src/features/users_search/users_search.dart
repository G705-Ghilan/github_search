import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_api/bloc/github_api_bloc.dart';
import 'package:github_api/bloc/github_api_bloc.dart' ;
import 'package:github_search/src/features/users_search/widgets/users_listview.dart';
import 'package:github_search/src/shared/widgets/error_view.dart';
import 'package:github_search/src/shared/widgets/github_search_field.dart';

import '../../shared/widgets/app_drawer.dart';

class UsersSearch extends StatelessWidget {
  UsersSearch({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: _key,
        resizeToAvoidBottomInset: false,
        drawer: const AppDrawer(),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 0, right: 10),
                child: GithubSearchField(
                  hintText: "Search for users",
                  controller: controller,
                  onSubmitted: (query) {
                    context
                        .read<GithubApiBloc>()
                        .add(SearchForUsers(query: query));
                  },
                  onTapMenu: () => _key.currentState?.openDrawer(),
                ),
              ),
              const Divider(),
              Expanded(
                child: Center(
                  child: BlocBuilder<GithubApiBloc, GithubApiState>(
                    builder: (context, state) {
                      if (state is GithubApiInitial) {
                        return const Text("Enter some text");
                      } else if (state is SearchLoading) {
                        return const CircularProgressIndicator();
                      } else if (state is SearchError) {
                        return ErrorView(msg: state.msg);
                      } else if (state is UsersSearchSuccess) {
                        return state.items.isEmpty
                            ? const Text("No Users")
                            : UsersListView(users: state.items);
                      } else if (context.read<GithubApiBloc>().users != null) {
                        final re = context.read<GithubApiBloc>().users;
                        return re!.isEmpty
                            ? const Text("No Users")
                            : UsersListView(users: re);
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
