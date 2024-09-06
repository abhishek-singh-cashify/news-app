import 'package:flutter/material.dart';
import 'package:news_app/common/widgets/common_header.dart';

class NoPageFoundScreen extends StatelessWidget {
  static const String route = "/no-page-registered";

  const NoPageFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: const GeneralHeader(
        title: "Not a Registered Route",
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox.shrink(),
                  Expanded(
                    child: Text(
                      "Not a registered page",
                      style: theme.primaryTextTheme.headlineMedium?.copyWith(
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
