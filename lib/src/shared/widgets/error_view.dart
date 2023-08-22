import 'package:flutter/material.dart';
import 'package:github_search/src/shared/extensions/context.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.msg,
  });
  final String msg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Oops",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            msg,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black.withOpacity(0.5)),
          ),
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
