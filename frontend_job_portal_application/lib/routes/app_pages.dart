import 'package:flutter/material.dart';
import 'package:frontend_job_portal_application/screens/home/home_bindings.dart';
import 'package:frontend_job_portal_application/screens/home/home_screen.dart';
import 'package:frontend_job_portal_application/screens/login/login_bindings.dart';
import 'package:frontend_job_portal_application/screens/login/login_screen.dart';
import 'package:frontend_job_portal_application/screens/signup/signup_bindings.dart';
import 'package:frontend_job_portal_application/screens/signup/signup_screen.dart';
import 'package:frontend_job_portal_application/screens/splash/splash_bindings.dart';
import 'package:frontend_job_portal_application/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

enum AppPages {
  splash(
    routeName: '/',
    page: SplashScreen(),
    bindings: SplashBinding(),
  ),
  login(
    routeName: '/login',
    page: LoginScreen(),
    bindings: LoginBinding(),
  ),
  signup(
    routeName: '/signup',
    page: SignupScreen(),
    bindings: SignupBinding(),
  ),
  home(
    routeName: '/home',
    page: HomeScreen(),
    bindings: HomeBindings(),
  );

  const AppPages({
    required this.routeName,
    required this.page,
    this.bindings,
  });

  /// Provides the route name of the current page.
  final String routeName;

  /// Provides the current page.
  final Widget page;

  /// Provides the bindings for the current page.
  final Bindings? bindings;

  /// Pushes a new named `page` to the stack.
  void push({dynamic pageArguements}) async {
    await Get.toNamed(
      routeName,
      arguments: pageArguements,
      preventDuplicates: true,
    );
  }

  ///Push a named `page` and pop several pages in the stack.
  void pushAfterPopAll({dynamic pageArguements}) async {
    await Get.offAllNamed(routeName, arguments: pageArguements);
  }

  ///Pop the current named `page` in the stack.
  void pop({dynamic pageArguements}) async {
    await Get.offNamed(routeName, arguments: pageArguements);
  }
}
