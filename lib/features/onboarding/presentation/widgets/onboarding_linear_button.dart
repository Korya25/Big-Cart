import 'package:big_cart/core/resources/style/theme/app_colors.dart';
import 'package:big_cart/core/constants/app_strings.dart';
import 'package:big_cart/core/utils/context_extions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingLinearButton extends StatelessWidget {
  final bool isLastPage;
  final VoidCallback onPressed;

  const OnboardingLinearButton({
    super.key,
    required this.isLastPage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50.h,
        width: 0.8.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.primaryDark],
          ),
        ),
        child: Center(
          child: Text(
            isLastPage ? AppStrings.getStarted : AppStrings.next,
            style: context.textStyle.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.textWhite,
            ),
          ),
        ),
      ),
    );
  }
}
