import 'package:big_cart/core/resources/app_text_styles.dart';
import 'package:big_cart/features/onboarding/data/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingModel data;

  const OnboardingContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.h),
        Text(
          data.title,
          textAlign: TextAlign.center,
          style: AppTextStyles.poppins30BlackBold,
        ),
        if (data.logoPng != null) ...[Image.asset(data.logoPng!, height: 60.h)],

        if (data.logoPng == null) ...[SizedBox(height: 8.h)],

        Text(
          data.subTitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.poppins15Grey500,
        ),
      ],
    );
  }
}
