extension ImagePathExtension on String {
  get _imagePath => "lib/core/assets/img";
  get _iconPath => "lib/core/assets/condition_icons";

  /// Returns normal image path
  String get toPng => "$_imagePath/$this.png";

  /// Returns day icons path
  String get toPngDayIcon => "$_iconPath/day/$this.png";

  /// Returns night icons path
  String get toPngNightIcon => "$_iconPath/night/$this.png";
}
