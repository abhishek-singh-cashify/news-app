import 'package:flutter/material.dart';
import 'package:news_app/common/widgets/common_header.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/general_list_shimmer_widget.dart';
import '../providers/news_feed_provider.dart';
import '../widgets/news_feed_card_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String route = "/home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider<NewsFeedProvider>(
      create: (_) => NewsFeedProvider(),
      lazy: false,
      builder: (BuildContext insideContext, __) {
        var provider = NewsFeedProvider.of(insideContext);
        return RefreshIndicator(
          onRefresh: () async {
            return Future.delayed(const Duration(milliseconds: 500), () {
              provider.refreshContent();
            });
          },
          child: Scaffold(
            appBar: const GeneralHeader(
              title: "News Feed",
              showBackButton: false,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox.shrink(),
                if (provider.isDataLoading == true) ...[
                  Expanded(
                    child: NewsFeedShimmerListWidget(
                      itemCount: 10,
                      scrollDirection: Axis.vertical,
                      separator: 14.0,
                      content: Container(
                        height: 270.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  )
                ] else if (provider.isDataLoading == false && provider.errorMessage == null) ...[
                  Expanded(
                    child: ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                        itemBuilder: (context, index) {
                          return NewsFeedCardWidget(
                            dataModel: provider.newsFeeds[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 14.0);
                        },
                        itemCount: provider.newsFeeds.length),
                  )
                ] else if (provider.isDataLoading == false && provider.errorMessage != null) ...[
                  Center(
                    child: Text(
                      "No News Feeds Found!!",
                      style: theme.primaryTextTheme.headlineSmall?.copyWith(color: theme.primaryColor),
                    ),
                  )
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
