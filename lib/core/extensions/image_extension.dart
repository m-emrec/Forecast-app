extension ImagePathExtension on String {
  get _imagePath => "lib/core/assets/img/";

  String get toPng => "$_imagePath$this.png";
}
