import 'package:ar_job_portal/routes/app_pages.dart';
import 'package:ar_job_portal/routes/app_routes.dart';
import 'package:ar_job_portal/services/candidate_service.dart';
import 'package:ar_job_portal/services/user_service.dart';
import 'package:ar_job_portal/styles/app_theme.dart';
import 'package:ar_job_portal/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

void main() async {
  await dotenv.load();
  await Get.putAsync<UserService>(() => UserService().init());
  await Get.putAsync<CandidateService>(() => CandidateService().init());
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
