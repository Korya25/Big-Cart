import 'package:big_cart/core/resources/routes/app_transtions.dart';
import 'package:big_cart/features/auth/presentation/pages/login_page.dart';
import 'package:big_cart/features/auth/presentation/pages/sign_up_page.dart';
import 'package:big_cart/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.onboarding,
    redirect: (context, state) {
      final box = Hive.box('myBox');
      final hasSeenOnboarding = box.get('seeOnBoreading', defaultValue: false);

      if (hasSeenOnboarding && state.matchedLocation == AppRoutes.onboarding) {
        return AppRoutes.login;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboarding,
        pageBuilder: (context, state) =>
            AppTransitions.fade(child: const OnboardingPage()),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.login,
        pageBuilder: (context, state) =>
            AppTransitions.slideFromRight(child: const LoginPage()),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        name: AppRoutes.signUp,
        pageBuilder: (context, state) =>
            AppTransitions.slideFromRight(child: const SignUpPage()),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        pageBuilder: (context, state) =>
            AppTransitions.noTransition(child: const Scaffold()),
      ),
      GoRoute(
        path: AppRoutes.productDetail,
        name: AppRoutes.productDetail,
        pageBuilder: (context, state) =>
            AppTransitions.fade(child: const Scaffold()),
      ),
    ],
  );
}
