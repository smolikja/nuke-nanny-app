import 'package:flutter/material.dart';
import 'package:nuke_nanny/core/styles/styles.dart';

/// A component for displaying page indicators for a carousel.
class PageIndicator extends StatelessWidget {
  /// Creates a [PageIndicator].
  const PageIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  /// The total number of pages.
  final int count;

  /// The index of the current page.
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, _buildIndicator),
    );
  }

  Widget _buildIndicator(int index) {
    final isActive = index == currentIndex;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: isActive ? 24.0 : 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        color:
            isActive
                ? Styles.appColors.primary
                : Styles.appColors.textTertiary.withValues(alpha: 0.3),
        borderRadius: Styles.borderRadiuses.circular,
      ),
    );
  }
}
