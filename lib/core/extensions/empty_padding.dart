import 'package:flutter/material.dart';

extension EmptyPadding on num {
  /// vertical spacing
  SizedBox get ph => SizedBox(
        height: toDouble(),
      );

  /// horizontal spacing
  SizedBox get pw => SizedBox(
        width: toDouble(),
      );
}
