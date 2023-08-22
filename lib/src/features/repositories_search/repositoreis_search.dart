import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_api/bloc/github_api_bloc.dart';
import 'package:github_search/src/shared/widgets/error_view.dart';
import 'package:github_search/src/shared/widgets/github_search_field.dart';
import 'package:github_search/src/features/repositories_search/widgets/search_resutl_list.dart';

import '../../shared/widgets/app_drawer.dart';

class RepositoreisSearch extends StatelessWidget {
  RepositoreisSearch({super.key});
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
                  hintText: "Search for repositories",
                  controller: controller,
                  onSubmitted: (value) {
                    context
                        .read<GithubApiBloc>()
                        .add(SearchForRepositories(query: value));
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
                      } else if (state is RepositoriesSearchSuccess) {
                        return state.items.isEmpty
                            ? const Text("No result")
                            : SearchResultList(items: state.items);
                      } else if (context.read<GithubApiBloc>().repositories !=
                          null) {
                        final re = context.read<GithubApiBloc>().repositories;
                        return re!.isEmpty
                            ? const Text("No result")
                            : SearchResultList(items: re!);
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
