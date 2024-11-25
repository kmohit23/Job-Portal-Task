import 'package:ar_job_portal/screens/candidate/candidate_binding.dart';
import 'package:ar_job_portal/screens/candidate/candidate_screen.dart';
import 'package:ar_job_portal/screens/home/admin/home_screen.dart';
import 'package:ar_job_portal/screens/home/user/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:ar_job_portal/screens/home/home_bindings.dart';
import 'package:ar_job_portal/screens/login/login_bindings.dart';
import 'package:ar_job_portal/screens/login/login_screen.dart';
import 'package:ar_job_portal/screens/signup/signup_bindings.dart';
import 'package:ar_job_portal/screens/signup/signup_screen.dart';
import 'package:ar_job_portal/screens/splash/splash_bindings.dart';
import 'package:ar_job_portal/screens/splash/splash_screen.dart';
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
  adminHome(
    routeName: '/admin-home',
    page: AdminHomeScreen(),
    bindings: HomeBindings(),
  ),
  userHome(
    routeName: '/user-home',
    page: UserHomeScreen(),
    bindings: HomeBindings(),
  ),
  candidate(
    routeName: '/candidate-details',
    page: CandidateScreen(),
    bindings: CandidateBinding(),
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
