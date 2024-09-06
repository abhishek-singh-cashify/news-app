import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:news_app/common/theme_mode_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CompleteArticleButton extends StatelessWidget {
  final String? articleUrl;

  const CompleteArticleButton({
    super.key,
    this.articleUrl,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = ThemeModeProvider.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Uri uri = Uri.parse(articleUrl!);
        print(articleUrl);
        canLaunchUrl(uri).then((value) {
          if (value) {

            launchUrl(
              uri,
              mode: LaunchMode.inAppBrowserView,
            );
          } else {}
        });
      },
      child: Card(
        elevation: 8.0,
        child: Container(
          width: double.infinity,
          height: 40.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color:  provider.mode == ThemeMode.dark?Colors.white70: theme.primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Complete Article",
                style: theme.primaryTextTheme.bodyLarge?.copyWith(color: provider.mode == ThemeMode.dark?Colors.black87: Colors.white, fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(width: 8.0),
               Icon(
                FeatherIcons.link2,
                color: provider.mode == ThemeMode.dark?Colors.black87: Colors.white,
                size: 25.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
