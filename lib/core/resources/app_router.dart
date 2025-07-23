import 'package:big_cart/core/resources/app_transtions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.onboarding,
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboarding,
        pageBuilder: (context, state) =>
            AppTransitions.fade(child: const Scaffold()),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.login,
        pageBuilder: (context, state) =>
            AppTransitions.slideFromRight(child: const Scaffold()),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        name: AppRoutes.signUp,
        pageBuilder: (context, state) =>
            AppTransitions.slideFromRight(child: const Scaffold()),
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
