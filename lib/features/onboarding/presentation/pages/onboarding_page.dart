import 'package:big_cart/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.onboardingPngs[0]),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
