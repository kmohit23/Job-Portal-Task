import 'package:frontend_job_portal_application/routes/app_pages.dart';
import 'package:get/get.dart';

class AppRoutes {
  /// Returns the available routes of the application.
  static List<GetPage> get routes => AppPages.values
      .map((pageType) => GetPage(
            name: pageType.routeName,
            page: () => pageType.page,
            binding: pageType.bindings,
          ))
      .toList();
}
