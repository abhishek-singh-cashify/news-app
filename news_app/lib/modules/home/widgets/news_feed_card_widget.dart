import 'package:flutter/material.dart';
import 'package:news_app/common/app_utils.dart';
import 'package:news_app/common/theme_mode_provider.dart';
import 'package:news_app/common/widgets/network_image_widget.dart';
import 'package:news_app/modules/news_description/screens/news_description_screen.dart';

import '../models/news_feed_response.dart';

class NewsFeedCardWidget extends StatefulWidget {
  final NewsFeedResponse? dataModel;

  const NewsFeedCardWidget({
    super.key,
    this.dataModel,
  });

  @override
  State<NewsFeedCardWidget> createState() => _NewsFeedCardWidgetState();
}

class _NewsFeedCardWidgetState extends State<NewsFeedCardWidget> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var theme = Theme.of(context);
    var provider = ThemeModeProvider.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.of(context).pushNamed(
          NewsDescriptionScreen.route,
          arguments: widget.dataModel,
        );
      },
      child: Card(
        elevation: 10.0,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 200.0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  child: fetchImage(
                    "assets/images/news_placeholder.png",
                    widget.dataModel?.urlToImage ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.dataModel?.title != null && widget.dataModel!.title!.isNotEmpty) ...[
                      Text(
                        widget.dataModel!.title!,
                        style: theme.primaryTextTheme.bodyLarge?.copyWith(
                            color: provider.mode == ThemeMode.dark ? Colors.white70 : Colors.black87,
                            fontSize: 22.0,
                            letterSpacing: 0.2,
                            height: 1.2),
                      ),
                      const SizedBox(height: 14.0),
                    ],
                    if (widget.dataModel?.publishedAt != null) ...[
                      Text(
                        AppUtils.formatDateAndTime(widget.dataModel!.publishedAt!, pattern: "dd MMM yyyy, h:mm aa"),
                        style: theme.primaryTextTheme.bodyLarge?.copyWith(color: provider.mode == ThemeMode.dark ? Colors.white70 : Colors.black87),
                      ),
                      const SizedBox(height: 14.0),
                    ],
                    if (widget.dataModel?.description != null && widget.dataModel!.description!.isNotEmpty) ...[
                      Row(
                        children: [
                          const SizedBox.shrink(),
                          Expanded(
                            child: Text(
                              widget.dataModel!.description!,
                              style: theme.primaryTextTheme.bodyLarge?.copyWith(color: provider.mode == ThemeMode.dark ? Colors.white70 : Colors.black87, height: 1.2),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8.0),
                    ],
                    if (widget.dataModel?.author != null && widget.dataModel!.author!.isNotEmpty) ...[
                      Row(
                        children: [
                          const SizedBox.shrink(),
                          Expanded(
                            child: Text(
                              "Author:- ${widget.dataModel!.author!}",
                              style: theme.primaryTextTheme.bodyLarge?.copyWith(color: provider.mode == ThemeMode.dark ? Colors.white70 : Colors.black87),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                    ],
                    if (widget.dataModel?.source != null && widget.dataModel!.source?.name != null) ...[
                      Row(
                        children: [
                          const SizedBox.shrink(),
                          Expanded(
                            child: Text(
                              "Source:- ${widget.dataModel!.source!.name!}",
                              style: theme.primaryTextTheme.bodyLarge?.copyWith(color: provider.mode == ThemeMode.dark ? Colors.white70 : Colors.black87),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
