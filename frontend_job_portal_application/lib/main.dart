import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend_job_portal_application/routes/app_pages.dart';
import 'package:frontend_job_portal_application/routes/app_routes.dart';
import 'package:frontend_job_portal_application/styles/app_theme.dart';
import 'package:frontend_job_portal_application/utils/constants.dart';
import 'package:get/get.dart';

void main() async {
  await dotenv.load();
  runApp(const JobPortalApp());
}

class JobPortalApp extends StatelessWidget {
  const JobPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      locale: Constants.appLocale,
      themeMode: ThemeMode.dark,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: AppPages.splash.routeName,
      initialBinding: AppPages.splash.bindings,
      getPages: AppRoutes.routes,
    );
  }
}
