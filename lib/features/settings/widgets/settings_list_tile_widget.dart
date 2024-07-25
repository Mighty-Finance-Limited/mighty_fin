import 'package:flutter/material.dart';
import 'package:mighty_fin/utils/constants/colors.dart';

class SettingsListTileWidget extends StatelessWidget {
  final String title;
  final String? subTitle;
  final IconData iconData;
  final Widget trailingWidget;
  final VoidCallback onPressed;

  const SettingsListTileWidget({
    super.key,
    required this.iconData,
    required this.title,
    required this.onPressed,
    required this.trailingWidget,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: ListTile(
        splashColor: theme.splashColor,
        minTileHeight: 52,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: theme.colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        title: Text(
          title,
        ),
        subtitle: subTitle != null ? Text(subTitle!) : null,
        leading: Icon(
          iconData,
          color: primary,
        ),
        trailing: trailingWidget,
        onTap: onPressed,
      ),
    );
  }
}
