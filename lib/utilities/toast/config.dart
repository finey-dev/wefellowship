import 'package:flutter/material.dart';
import 'package:wefellowship/src/configs/configs.dart';

class RelightToastType {
  /// message is `required` parameter
  final String message;

  /// color is optional, if provided null then `DefaultColors` will be used
  final Color? color;

  //icon for different types of Toast
  final String? icon;

  RelightToastType(this.message, this.color, this.icon);

  static RelightToastType info = RelightToastType(
    'info',
    const Color(0xFF58a6ff),
    AppAssetsPath.help,
  );
  static RelightToastType success = RelightToastType(
    'info',
    const Color(0xFF56d364),
    AppAssetsPath.success,
  );
  static RelightToastType warning = RelightToastType(
    'info',
    const Color(0xFFe3b341),
    AppAssetsPath.warning,
  );
  static RelightToastType error = RelightToastType(
    'info',
    const Color(0xFFf85149),
    AppAssetsPath.error,
  );
  static RelightToastType delete = RelightToastType(
    'info',
    const Color(0xFFf85149),
    AppAssetsPath.delete,
  );
}

/// Text direction used to determine which direction to draw the toast
enum ToastOrientation { ltr, rtl }

/// The fade in animation direction of the toast.
enum AnimationType { fromBottom, fromLeft, fromRight, fromTop }

/// The position of the toast on the screen.
enum RelightToastPosition { center, bottom, top }

/// The appearance of the background of the toast.
enum BackgroundType { transparent, solid, lighter }
