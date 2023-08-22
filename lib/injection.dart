import 'package:get_it/get_it.dart';
import 'package:github_api/bloc/github_api_bloc.dart';
import 'package:github_api/github_api.dart';

import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl = GetIt.instance;

Future dependenciesInjection() async {
  // dependecies injection

  sl.registerSingleton<GithubClient>(GithubClient());
  sl.registerSingleton<GithubCache>(GithubCache());
  sl.registerSingleton<GithubRepository>(
    GithubRepository(client: sl(), cache: sl()),
  );

  sl.registerSingleton(GithubApiBloc(repository: sl()));

  sl.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
}
