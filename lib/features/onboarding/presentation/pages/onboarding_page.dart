import 'package:big_cart/core/constants/hive_keys.dart';
import 'package:big_cart/core/resources/routes/app_routes.dart';
import 'package:big_cart/core/services/hive_service.dart';
import 'package:big_cart/features/onboarding/data/onboarding_data.dart';
import 'package:big_cart/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:big_cart/features/onboarding/presentation/widgets/onboarding_indicator.dart';
import 'package:big_cart/features/onboarding/presentation/widgets/onboarding_linear_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  final HiveService _hiveService = HiveService();

  int currentPage = 0;

  void _onNext() async {
    final isLastPage = currentPage == OnboardingData.onboardingData.length - 1;
    if (isLastPage) {
      context.goNamed(AppRoutes.login);
      await _hiveService.write(
        HiveKeys.mainBox,
        HiveKeys.hasSeenOnboarding,
        true,
      );
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: OnboardingData.onboardingData.length,
            onPageChanged: (index) => setState(() => currentPage = index),
            itemBuilder: (_, index) {
              final data = OnboardingData.onboardingData[index];
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(data.backgroundImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SafeArea(
                  child: Center(child: OnboardingContent(data: data)),
                ),
              );
            },
          ),
          Positioned(
            bottom: 25.h,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Column(
                spacing: 30.h,
                children: [
                  OnboardingIndicator(controller: _pageController),
                  OnboardingLinearButton(
                    isLastPage:
                        currentPage == OnboardingData.onboardingData.length - 1,
                    onPressed: _onNext,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
