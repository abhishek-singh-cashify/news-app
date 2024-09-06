import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:news_app/common/theme_mode_provider.dart';

class GeneralHeader extends StatelessWidget implements PreferredSizeWidget {
  final double toolbarHeight;
  final PreferredSizeWidget? bottom;
  final bool showBackButton;
  final String? title;

  const GeneralHeader({
    super.key,
    this.toolbarHeight = kToolbarHeight,
    this.bottom,
    this.showBackButton = false,
    this.title = "",
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = ThemeModeProvider.of(context);
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: theme.primaryColor,
      elevation: 4.0,
      leading: (showBackButton == true)
          ? GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                FeatherIcons.arrowLeft,
                size: 25,
                color: Colors.white,
              ),
            )
          : null,
      title: Text(
        title ?? "",
        style: theme.primaryTextTheme.headlineSmall?.copyWith(color: Colors.white, fontSize: 22.0),
      ),
      actions: [
        Switch(
          value: provider.mode == ThemeMode.dark,
          onChanged: (value) {
            provider.toggleThemeMode(value);
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize {
    double bottomBarHeight = bottom?.preferredSize.height ?? 0.0;
    return Size.fromHeight(toolbarHeight + bottomBarHeight);
  }
}
