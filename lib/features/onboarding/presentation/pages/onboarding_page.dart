import 'package:big_cart/core/resources/routes/app_routes.dart';
import 'package:big_cart/features/onboarding/data/onboarding_data.dart';
import 'package:big_cart/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:big_cart/features/onboarding/presentation/widgets/onboarding_indicator.dart';
import 'package:big_cart/features/onboarding/presentation/widgets/onboarding_linear_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  void _onNext() {
    final isLastPage = currentPage == OnboardingData.onboardingData.length - 1;
    if (isLastPage) {
      context.goNamed(AppRoutes.login);
      var box = Hive.box('myBox');
      box.put('seeOnBoreading', true);
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
                child: Center(child: OnboardingContent(data: data)),
              );
            },
          ),
          Positioned(
            bottom: 30.h,
            left: 0,
            right: 0,
            child: Column(
              spacing: 40.h,
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
        ],
      ),
    );
  }
}
