import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// to handle failure, success, help and warning `SnackbarType` class is being used
class SnackbarType {
  /// message is `required` parameter
  final String message;

  /// color is optional, if provided null then `DefaultColors` will be used
  final Color? color;

  SnackbarType(this.message, [this.color]);

  static SnackbarType info = SnackbarType('help', const Color(0xFF58a6ff),);
  static SnackbarType error = SnackbarType(
    'failure',
    const Color(0xFFf85149),
  );
  static SnackbarType success = SnackbarType(
    'success',
    const Color(0xFF56d364),
  );
  static SnackbarType warning = SnackbarType(
    'warning',
    const Color(0xFFe3b341),
  );
}
