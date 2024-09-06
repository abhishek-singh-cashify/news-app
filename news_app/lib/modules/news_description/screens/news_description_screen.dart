import 'package:flutter/material.dart';
import 'package:news_app/common/theme_mode_provider.dart';
import 'package:news_app/common/widgets/common_header.dart';
import 'package:news_app/common/widgets/network_image_widget.dart';

import '../../../common/app_utils.dart';
import '../../home/models/news_feed_response.dart';
import '../widgets/complete_article_button.dart';

class NewsDescriptionScreen extends StatelessWidget {
  static const String route = "/description";

  const NewsDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var args = ModalRoute.of(context)?.settings.arguments as NewsFeedResponse?;
    var provider = ThemeModeProvider.of(context);
    return Scaffold(
      appBar: const GeneralHeader(
        title: "Full Story",
        showBackButton: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 350.0,
                    child: ClipRRect(
                      child: fetchImage(
                        "assets/images/news_placeholder.png",
                        args?.urlToImage ?? "",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (args?.title != null && args!.title!.isNotEmpty) ...[
                          Text(
                            args.title!,
                            style: theme.primaryTextTheme.bodyLarge
                                ?.copyWith(color: provider.mode == ThemeMode.dark ? Colors.white70 : Colors.black87, fontSize: 22.0, letterSpacing: 0.2, height: 1.2),
                          ),
                          const SizedBox(height: 14.0),
                        ],
                        if (args?.publishedAt != null) ...[
                          Text(
                            AppUtils.formatDateAndTime(args!.publishedAt!, pattern: "dd MMM yyyy, h:mm aa"),
                            style: theme.primaryTextTheme.bodyLarge?.copyWith(color: provider.mode == ThemeMode.dark ? Colors.white70 : Colors.black87, fontSize: 20),
                          ),
                          const SizedBox(height: 14.0),
                        ],
                        if (args?.description != null && args!.description!.isNotEmpty) ...[
                          Row(
                            children: [
                              const SizedBox.shrink(),
                              Expanded(
                                child: Text(
                                  args.description!,
                                  style: theme.primaryTextTheme.bodyLarge
                                      ?.copyWith(color: provider.mode == ThemeMode.dark ? Colors.white70 : Colors.black54, height: 1.2, fontSize: 20),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 16.0),
                        ],
                        if (args?.author != null && args!.author!.isNotEmpty) ...[
                          Row(
                            children: [
                              const SizedBox.shrink(),
                              Expanded(
                                child: Text(
                                  "Author:- ${args.author!}",
                                  style:
                                      theme.primaryTextTheme.bodyLarge?.copyWith(color: provider.mode == ThemeMode.dark ? Colors.white70 : Colors.black87, fontSize: 20),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                        ],
                        if (args?.source != null && args!.source?.name != null) ...[
                          Row(
                            children: [
                              const SizedBox.shrink(),
                              Expanded(
                                child: Text(
                                  "Source:- ${args.source!.name!}",
                                  style: theme.primaryTextTheme.bodyLarge?.copyWith(
                                      color: provider.mode == ThemeMode.dark ? Colors.white70 : Colors.black87,
                                      fontSize: 20),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          if (args?.url != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: CompleteArticleButton(
                articleUrl: args!.url!,
              ),
            )
          ],
        ],
      ),
    );
  }
}
