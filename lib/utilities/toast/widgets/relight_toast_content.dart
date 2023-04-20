import 'package:flutter/material.dart';
import 'package:wefellowship/utilities/utilities.dart';

/// Flow of the contents in the Relight toast.
enum ContentLayoutType { normal, reversed }

class RelightToastContent extends StatelessWidget {
  RelightToastContent({
    Key? key,
    required this.color,
    required this.description,
    required this.icon,
    required this.iconSize,
    required this.radius,
    required this.title,
    required this.withAnimation,
    required this.displaySideBar,
    bool isReversed = false,
  }) : super(key: key) {
    _contentLayoutType = ContentLayoutType.values[isReversed ? 1 : 0];
  }

  /// The flow of the contents in the motion toast.
  late final ContentLayoutType _contentLayoutType;

  /// The color of the toast background.
  final Color color;

  /// Border radius of the toast.
  final double radius;

  /// Size of the toast icon.
  final double iconSize;

  /// Icon to display on the toast.
  final IconData? icon;

  /// Set to `true` to show animation of the toast.
  final bool withAnimation;

  /// Title [Text] widget of the toast.
  final Widget? title;

  /// Description [Text] widget of the toast.
  final Widget description;

  final bool displaySideBar;

  @override
  Widget build(BuildContext context) {
    if (_contentLayoutType == ContentLayoutType.reversed) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Seperator.double(10),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (title != null) title!,
                  description,
                ],
              ),
            ),
          ),
          if (icon != null)
            Row(
              children: [
                const Seperator.double(15),
                RelightToastIcon(
                  iconSize: iconSize,
                  color: color,
                  icon: icon!,
                  withAnimation: withAnimation,
                ),
              ],
            ),
          if (displaySideBar)
            Row(
              children: [
                const Seperator.double(15),
                RelightToastSideBar(
                  color: color,
                  radius: radius,
                ),
              ],
            ),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (displaySideBar)
          Row(
            children: [
              RelightToastSideBar(
                color: color,
                radius: radius,
              ),
              const Seperator.double(15),
            ],
          ),
        if (icon != null)
          Row(
            children: [
              RelightToastIcon(
                iconSize: iconSize,
                color: color,
                icon: icon!,
                withAnimation: withAnimation,
              ),
              const Seperator.double(15),
            ],
          ),
        Flexible(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              right: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (title != null) title!,
                description,
              ],
            ),
          ),
        ),
        const Seperator.double(7),
      ],
    );
  }
}
