import 'package:nuke_nanny/core/styles/border_radiuses/border_radiuses.dart';
import 'package:nuke_nanny/core/styles/colors/app_colors.dart';
import 'package:nuke_nanny/core/styles/text_styles/text_styles.dart';

/// A class that provides access to all styling elements in the application.
///
/// This class centralizes access to colors, text styles, and border radiuses
/// to ensure consistent styling across the application.
class Styles {
  /// Provides access to the application's color scheme.
  static AppColors appColors = AppColors();

  /// Provides access to the application's text styles.
  static TextStyles textStyles = TextStyles();

  /// Provides access to the application's border radiuses.
  static BorderRadiuses borderRadiuses = BorderRadiuses();
}
