import 'package:flutter/material.dart';
import 'package:github_api/bloc/github_api_bloc.dart';
import 'package:github_search/src/features/repositories_search/bloc/repositories_search_bloc.dart';
import 'injection.dart';

import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:github_search/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/src/features/users_search/bloc/users_search_bloc.dart';
import 'package:github_search/src/shared/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependenciesInjection();

  runApp(const GithubSearchApp());
}

class GithubSearchApp extends StatelessWidget {
  const GithubSearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RepositoreisSearchBloc(),
        ),
        BlocProvider(
          create: (context) => UsersSearchBloc(),
        ),
        BlocProvider(
          create: (context) => sl.get<GithubApiBloc>(),
        ),
      ],
      child: BlocBuilder<RepositoreisSearchBloc, RepositoreisSearchState>(
        buildWhen: (previous, current) => current is ThemeChangedState,
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            routes: Routes.routes,
            themeMode:
                ThemeMode.values[state is ThemeChangedState ? state.mode : 1],
            initialRoute: sl.get<SharedPreferences>().getBool("started") == true
                ? Routes.home.name
                : Routes.welcome.name,
          );
        },
      ),
    );
  }
}
