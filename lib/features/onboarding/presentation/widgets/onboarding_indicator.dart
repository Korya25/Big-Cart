import 'package:big_cart/core/resources/style/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:big_cart/features/onboarding/data/onboarding_data.dart';

class OnboardingIndicator extends StatelessWidget {
  final PageController controller;

  const OnboardingIndicator({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: OnboardingData.onboardingData.length,
      effect: WormEffect(
        dotHeight: 10.h,
        dotWidth: 10.w,
        spacing: 6.w,
        activeDotColor: AppColors.primaryDark,
        dotColor: Color(0xffDCDCDC),
      ),
    );
  }
}
