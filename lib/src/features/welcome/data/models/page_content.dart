class PageContent {
  final String imageName;
  final String title;
  final String subTitle;
  final bool isTheLast;

  PageContent(
      {required this.imageName,
      required this.title,
      required this.subTitle,
      this.isTheLast = false});

  String get img => "assets/images/$imageName";
}
