import 'package:big_cart/core/constants/hive_keys.dart';
import 'package:big_cart/core/resources/routes/app_routes.dart';
import 'package:big_cart/core/services/hive_service.dart';
import 'package:big_cart/core/resources/routes/app_transtions.dart';
import 'package:big_cart/features/auth/presentation/pages/login_page.dart';
import 'package:big_cart/features/auth/presentation/pages/sign_up_page.dart';
import 'package:big_cart/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final HiveService _hiveService = HiveService();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.onboarding,
    redirect: (context, state) async {
      final hasSeenOnboarding = await _hiveService.read<bool>(
        HiveKeys.mainBox,
        HiveKeys.hasSeenOnboarding,
      );

      if ((hasSeenOnboarding ?? false) &&
          state.matchedLocation == AppRoutes.onboarding) {
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
