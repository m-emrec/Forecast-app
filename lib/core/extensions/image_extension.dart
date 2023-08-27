extension ImagePathExtension on String {
  get _imagePath => "lib/core/assets/img";
  get _iconPath => "lib/core/assets/condition_icons";

  ///
  String get toPng => "$_imagePath/$this.png";
  String get toPngDayIcon => "$_iconPath/day/$this.png";
  String get toPngNightIcon => "$_iconPath/night/$this.png";
}
