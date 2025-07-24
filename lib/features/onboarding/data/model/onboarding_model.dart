class OnboardingModel {
  final String backgroundImage;
  final String title;
  final String subTitle;
  final String? logoSvg;

  OnboardingModel({
    required this.backgroundImage,
    required this.title,
    required this.subTitle,
    this.logoSvg,
  });
}
