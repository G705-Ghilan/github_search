import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/src/features/users_search/bloc/users_search_bloc.dart';

import '../routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: BlocBuilder<UsersSearchBloc, UsersSearchState>(
          buildWhen: (previous, current) => current is DrawerIndexChanged,
          builder: (context, state) {
            int index = context.read<UsersSearchBloc>().index;
            if (state is DrawerIndexChanged) {
              index = state.index;
            }
            return NavigationDrawer(
              selectedIndex: index,
              onDestinationSelected: (value) {
                context
                    .read<UsersSearchBloc>()
                    .add(DrawerChangeItem(index: value));
                [
                  Routes.home,
                  Routes.usersSearch,
                ][value]
                    .openUntil(context);
              },
              children: [
                headline("App"),
                const NavigationDrawerDestination(
                  icon: Icon(Icons.auto_awesome_mosaic_outlined),
                  label: Text("Repositories search"),
                ),
                const NavigationDrawerDestination(
                  icon: Icon(Icons.person_3_outlined),
                  label: Text("Users seacrh"),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget headline(String text) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(text),
    );
  }
}
