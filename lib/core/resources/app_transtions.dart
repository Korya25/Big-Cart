import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppTransitions {
  static CustomTransitionPage<T> fade<T>({required Widget child}) {
    return CustomTransitionPage<T>(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  static CustomTransitionPage<T> slideFromRight<T>({required Widget child}) {
    return CustomTransitionPage<T>(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  static CustomTransitionPage<T> noTransition<T>({required Widget child}) {
    return CustomTransitionPage<T>(
      child: child,
      transitionsBuilder: (_, __, ___, child) => child,
    );
  }
}
