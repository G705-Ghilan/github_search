import 'package:flutter/material.dart';
import 'package:github_search/src/shared/widgets/custom_button.dart';
import 'package:github_search/src/shared/extensions/context.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:github_api/github_api.dart';
class RepositoryDialog extends StatelessWidget {
  const RepositoryDialog({super.key, required this.item});

  final SearchResultItem item;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: context.shape,
      child: Padding(
        padding: context.padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: context.radius,
              child: SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    item.owner.avatarUrl,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  )),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(item.name),
              subtitle: Text(item.description),
            ),
            CustomButton(
              text: "Open repository",
              onTap: () async {
                if (await canLaunchUrl(item.uri)) {
                  await launchUrl(item.uri).then((value) => context.nav.pop());
                }
              },
            )
          ],
        ),
      ),
    );
  }

  static show(BuildContext context, SearchResultItem item) {
    showDialog(
      context: context,
      builder: (context) {
        return RepositoryDialog(item: item);
      },
    );
  }
}
