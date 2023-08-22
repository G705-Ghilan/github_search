import 'package:flutter/material.dart';
import 'package:github_search/src/features/repositories_search/repositoreis_search.dart';
import 'package:github_search/src/features/users_search/users_search.dart';
import 'package:github_search/src/features/welcome/presentation/welcome.dart';
import 'package:github_search/src/shared/extensions/context.dart';

class Routes {
  static final Page welcome = Page(WelcomePage());
  static final Page home = Page(RepositoreisSearch());
  static final Page usersSearch = Page(UsersSearch());

  static List<Page> pages = [
    welcome,
    home,
    usersSearch,
  ];

  static Map<String, Widget Function(BuildContext)> get routes => {
        for (Page page in pages) page.name: page.route,
      };
}

class Page {
  final Widget page;

  Page(this.page);

  String get name => page.toString();

  Widget Function(BuildContext context) get route => (context) => page;

  Future openUntil(BuildContext context) async {
    await context.nav.pushReplacementNamed(name);
  }

  Future open(BuildContext context) async {
    await context.nav.pushNamed(name);
  }
}
