import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsFeedShimmerListWidget extends StatelessWidget {
  final Widget content;
  final Axis? scrollDirection;
  final double? separator;
  final int? itemCount;
  final EdgeInsets? padding;

  const NewsFeedShimmerListWidget({
    super.key,
    required this.content,
    this.scrollDirection,
    this.separator,
    this.itemCount,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListView.separated(
      scrollDirection: scrollDirection ?? Axis.vertical,
      padding: padding ?? const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: theme.canvasColor,
          highlightColor: theme.dividerColor.withAlpha(100),
          child: content,
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: separator ?? 8.0);
      },
      itemCount: itemCount ?? 5,
    );
  }
}
