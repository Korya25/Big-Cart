import 'package:big_cart/core/presentation/widgets/text_app.dart';
import 'package:big_cart/core/resources/style/theme/app_colors.dart';
import 'package:big_cart/core/utils/context_extions.dart';
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
          style: context.textStyle.copyWith(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textBlack,
          ),
        ),
        if (data.logoPng != null) ...[Image.asset(data.logoPng!, height: 60.h)],

        if (data.logoPng == null) ...[SizedBox(height: 8.h)],

        TextApp(
          text: data.subTitle,
          textAlign: TextAlign.center,
          style: context.textStyle.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textGrey,
          ),
        ),
      ],
    );
  }
}
