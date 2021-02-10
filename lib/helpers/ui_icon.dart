import 'package:flutter/material.dart';

import 'ui_scale.dart';

class UIIcon {
  static Widget search({double size, Color color = Colors.white}) {
    size ??= UIScale.width(5);
    return Icon(Icons.search, size: size, color: color);
  }

  static Widget menu({double size, Color color = Colors.white}) {
    size ??= UIScale.width(5);
    return Icon(Icons.menu, size: size, color: color);
  }

  static Widget arrowBack({double size, Color color = Colors.white}) {
    size ??= UIScale.width(5);
    return Icon(Icons.arrow_back, size: size, color: color);
  }

  static Widget share({double size, Color color = Colors.white}) {
    size ??= UIScale.width(5);
    return Icon(Icons.share, size: size, color: color);
  }

  static Widget youtube({double size, Color color = Colors.white}) {
    size ??= UIScale.width(5);
    return Icon(Icons.play_arrow, size: size, color: color);
  }

  static Widget reddit({double size, Color color = Colors.white}) {
    size ??= UIScale.width(5);
    return Icon(Icons.child_care, size: size, color: color);
  }
}
