import 'dart:math';

import 'package:big_cart/core/constants/app_assets.dart';
import 'package:big_cart/core/constants/app_strings.dart';
import 'package:big_cart/features/onboarding/data/model/onboarding_model.dart';

class OnboardingData {
  static List<OnboardingModel> onboardingData = List.generate(
    minLength,
    (index) => OnboardingModel(
      backgroundImage: AppAssets.onboardingPngs[index],
      title: AppStrings.onboardingTitles[index],
      subTitle: AppStrings.onboardingSubtitles[index],
      logoSvg: index == 0 ? AppAssets.appLogoSvg : null,
    ),
  );

  static int get minLength {
    return min(
      AppAssets.onboardingPngs.length,
      min(
        AppStrings.onboardingTitles.length,
        AppStrings.onboardingSubtitles.length,
      ),
    );
  }
}
