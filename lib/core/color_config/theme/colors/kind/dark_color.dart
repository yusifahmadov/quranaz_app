part of '../color_manager.dart';

class DarkColors implements IColors {
  @override
  final _AppColors colors = _AppColors();

  @override
  ColorScheme? colorScheme;

  @override
  Brightness? brightness;

  @override
  Color? appBarColor;

  @override
  Color? scaffoldBackgroundColor;

  @override
  Color? tabBarColor;

  @override
  Color? tabbarNormalColor;

  @override
  Color? tabbarSelectedColor;

  DarkColors() {
    appBarColor = colors.green;
    scaffoldBackgroundColor = colors.green;
    fillColor = colors.lightGrey;
    tabBarColor = colors.green;
    tabbarNormalColor = colors.green;
    tabbarSelectedColor = colors.green;
    colorScheme = const ColorScheme.dark()
        .copyWith(onPrimary: colors.green, onSecondary: colors.green);
    brightness = Brightness.dark;
  }

  @override
  Color? primary;

  @override
  Color? fillColor;
}
