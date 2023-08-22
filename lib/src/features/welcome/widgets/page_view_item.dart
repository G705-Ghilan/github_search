import 'package:flutter/material.dart';
import 'package:github_search/src/shared/widgets/custom_button.dart';

import '../data/models/page_content.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.pageContent, this.onNext});
  final PageContent pageContent;
  final void Function()? onNext;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: 16 / 12,
                child: Image.asset(
                  pageContent.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 80),
            Text(
              pageContent.title,
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              pageContent.subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.color
                      ?.withOpacity(0.5)),
            ),
            const Spacer(),
            CustomButton(
              text: pageContent.isTheLast ? "Get started" : "Next",
              onTap: onNext,
            ),
          ],
        ),
      ),
    );
  }
}
