import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/src/features/repositories_search/bloc/repositories_search_bloc.dart';
import 'package:github_search/src/shared/extensions/context.dart';


class GithubSearchField extends StatefulWidget {
  const GithubSearchField({
    super.key,
    this.onTapMenu,
    required this.hintText,
    this.onSubmitted, this.controller,
  });

  final void Function()? onTapMenu;
  final void Function(String)? onSubmitted;
  final String hintText;
  final TextEditingController? controller;

  @override
  State<GithubSearchField> createState() => _GithubSearchFieldState();
}

class _GithubSearchFieldState extends State<GithubSearchField> {
  late RepositoreisSearchBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = context.read<RepositoreisSearchBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: widget.onTapMenu, icon: const Icon(Icons.menu)),
        Expanded(
          child: ClipRRect(
            borderRadius: context.radius,
            child: TextField(
              controller: widget.controller,
              onSubmitted: widget.onSubmitted,
              decoration: InputDecoration(
                filled: true,
                hintText: widget.hintText,
                hintStyle: const TextStyle(fontWeight: FontWeight.normal),
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    homeBloc.add(ChangeThemeEvent());
                  },
                  icon: BlocBuilder<RepositoreisSearchBloc, RepositoreisSearchState>(
                    buildWhen: (previous, current) =>
                        current is ThemeChangedState,
                    builder: (context, state) {
                      return Icon([
                        Icons.dark_mode_outlined,
                        Icons.light_mode_outlined
                      ][state is ThemeChangedState ? state.mode - 1 : 0]);
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
