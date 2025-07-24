import 'package:big_cart/features/onboarding/data/onboarding_data.dart';
import 'package:big_cart/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:big_cart/features/onboarding/presentation/widgets/onboarding_indicator.dart';
import 'package:big_cart/features/onboarding/presentation/widgets/onboarding_linear_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      // TODO: Navigate to Home/Login
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
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
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double value = 1.0;
                  if (_pageController.position.haveDimensions) {
                    value = (_pageController.page ?? 0) - index;
                    value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                  }

                  return Transform.scale(
                    scale: value,
                    child: Opacity(
                      opacity: value,
                      child: _OnboardingPageItem(index: index),
                    ),
                  );
                },
              );
            },
          ),
          Positioned(
            bottom: 30.h,
            left: 0,
            right: 0,
            child: Column(
              children: [
                OnboardingIndicator(controller: _pageController),
                SizedBox(height: 20.h),
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

class _OnboardingPageItem extends StatelessWidget {
  final int index;
  const _OnboardingPageItem({required this.index});

  @override
  Widget build(BuildContext context) {
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
  }
}
