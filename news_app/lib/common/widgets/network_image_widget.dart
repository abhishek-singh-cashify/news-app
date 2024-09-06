import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'genral_basic_shimmer.dart';

Widget fetchImage(String placeholder, String? url, {BoxFit? fit}) {
  return CachedNetworkImage(
    imageUrl: url ?? "",
    useOldImageOnUrlChange: true,
    fit: fit,
    placeholder: (context, url) {
      return const GeneralShimmerWidget(show: true);
    },
    errorWidget: (BuildContext context, String url, dynamic error) {
      return Image.asset(
        placeholder,
        fit: fit,
        cacheHeight: 100,
        cacheWidth: 100,
      );
    },
  );
}
