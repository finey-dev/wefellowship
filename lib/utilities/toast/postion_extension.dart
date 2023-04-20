import 'package:flutter/material.dart';
import 'package:wefellowship/utilities/utilities.dart';


extension RelightToastPositionExtensions on RelightToastPosition {
  Alignment get alignment {
    if (this == RelightToastPosition.top) {
      return Alignment.topCenter;
    } else if (this == RelightToastPosition.bottom) {
      return Alignment.bottomCenter;
    } else {
      return Alignment.center;
    }
  }
}
