import 'package:flutter/material.dart';
import 'package:github_search/injection.dart';
import 'package:github_search/src/features/welcome/widgets/page_view_item.dart';
import 'package:github_search/src/shared/extensions/context.dart';
import 'package:github_search/src/shared/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'data/data.dart';
import 'data/models/page_content.dart';



class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              children: pagesContent.map(
                (pageContent) {
                  return PageViewItem(
                    pageContent: pageContent,
                    onNext: () async {
                      if (pageContent.isTheLast) {
                        sl
                            .get<SharedPreferences>()
                            .setBool("started", true)
                            .then((value) => Routes.home.openUntil(context));
                      } else {
                        animateTo(pageContent);
                      }
                    },
                  );
                },
              ).toList(),
            ),
          ),
          Container(
            height: 50,
            alignment: Alignment.center,
            child: SmoothPageIndicator(
              controller: controller,
              count: pagesContent.length,
              effect: ExpandingDotsEffect(
                activeDotColor: context.colorScheme.primary,
                dotColor: context.colorScheme.onBackground.withOpacity(0.1),
                dotHeight: 12,
                dotWidth: 12,
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  void animateTo(PageContent pageContent) {
    controller.animateToPage(
      pagesContent.indexOf(pageContent) + 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );
  }
}
