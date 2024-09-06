import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GeneralShimmerWidget extends StatelessWidget {
  final Widget? child;
  final bool? show;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final double? radius;

  const GeneralShimmerWidget({
    super.key,
    this.child,
    this.show = true,
    this.width,
    this.height,
    this.padding,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return show!
        ? Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Shimmer.fromColors(
        baseColor: theme.canvasColor,
        highlightColor: theme.dividerColor.withAlpha(100),
        child: Container(
          height: height,
          width: width,
          decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(radius ?? 0), color: theme.colorScheme.surface),
          child: child,
        ),
      ),
    )
        : child ?? Container();
  }
}
