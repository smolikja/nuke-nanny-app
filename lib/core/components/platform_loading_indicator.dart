import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Platformově specifický indikátor načítání.
///
/// Automaticky zobrazí [CupertinoActivityIndicator] na iOS
/// a [CircularProgressIndicator] na ostatních platformách.
class PlatformLoadingIndicator extends StatelessWidget {
  /// Vytvoří novou instanci [PlatformLoadingIndicator].
  const PlatformLoadingIndicator({
    super.key,
    this.color,
    this.size = 20.0,
  });

  /// Barva indikátoru (pouze pro Android).
  final Color? color;

  /// Velikost indikátoru.
  final double size;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoActivityIndicator(
        radius: size / 2,
      );
    } else {
      return SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          color: color,
        ),
      );
    }
  }
}
