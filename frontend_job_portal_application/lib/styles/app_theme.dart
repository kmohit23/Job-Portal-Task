import 'package:flutter/material.dart';
import 'package:frontend_job_portal_application/styles/app_colors.dart';
import 'package:frontend_job_portal_application/styles/app_theme_colors.dart';
import 'package:frontend_job_portal_application/utils/ui_utils.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme =>
      ThemeData.light(useMaterial3: true).copyWith(
          brightness: Brightness.light,
          scaffoldBackgroundColor: AppColors.lightBackgroundColor,
          cardColor: AppColors.lightCardColor,
          dividerColor: AppColors.lightDividerPrimaryColor,
          focusColor: AppColors.lightDividerSecondaryColor,
          disabledColor: AppColors.lightInactiveTileColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.lightCardColor,
            elevation: 1,
            centerTitle: true,
            surfaceTintColor: Colors.transparent,
            shadowColor: AppColors.lightDividerSecondaryColor,
          ),
          drawerTheme: const DrawerThemeData(
            backgroundColor: AppColors.lightBackgroundColor,
            shape: RoundedRectangleBorder(),
          ),
          elevatedButtonTheme: const ElevatedButtonThemeData(
              style: ButtonStyle(
            elevation: WidgetStatePropertyAll(1),
            padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0)),
            minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50.0)),
            maximumSize:
                WidgetStatePropertyAll(Size(double.infinity, double.infinity)),
            backgroundColor: WidgetStatePropertyAll(AppColors.lightCardColor),
            foregroundColor:
                WidgetStatePropertyAll(AppColors.lightSecondaryTextColor),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          )),
          textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
                  padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0)),
                  minimumSize:
                      WidgetStatePropertyAll(Size(double.infinity, 50.0)),
                  maximumSize: WidgetStatePropertyAll(
                      Size(double.infinity, double.infinity)),
                  backgroundColor:
                      WidgetStatePropertyAll(AppColors.lightCardColor),
                  foregroundColor:
                      WidgetStatePropertyAll(AppColors.lightSecondaryTextColor),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ))),
          iconButtonTheme: const IconButtonThemeData(
              style: ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.zero),
            iconSize: WidgetStatePropertyAll(20.0),
          )),
          textTheme: TextTheme(
            titleMedium: GoogleFonts.nunito(
              fontSize: 28,
              fontWeight: UiUtilities.semiBold,
              color: AppColors.lightPrimaryTextColor,
            ),
            labelLarge: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: UiUtilities.semiBold,
              color: AppColors.lightPrimaryTextColor,
            ),
            labelMedium: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: UiUtilities.semiBold,
              color: AppColors.lightPrimaryTextColor,
            ),
            labelSmall: GoogleFonts.nunito(
              fontSize: 14,
              fontWeight: UiUtilities.semiBold,
              color: AppColors.lightPrimaryTextColor,
            ),
            bodyLarge: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: AppColors.lightPrimaryTextColor,
            ),
            bodyMedium: GoogleFonts.nunito(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColors.lightPrimaryTextColor,
            ),
            bodySmall: GoogleFonts.nunito(
              fontSize: 10,
              fontWeight: FontWeight.normal,
              color: AppColors.lightPrimaryTextColor,
            ),
          ),
          extensions: [
            AppThemeColors(),
          ]);
  static ThemeData get darkTheme => ThemeData.dark(useMaterial3: true).copyWith(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.darkBackgroundColor,
          cardColor: AppColors.darkCardColor,
          dividerColor: AppColors.darkDividerPrimaryColor,
          focusColor: AppColors.darkDividerSecondaryColor,
          disabledColor: AppColors.darkInactiveTileColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.darkCardColor,
            elevation: 1,
            centerTitle: true,
            surfaceTintColor: Colors.transparent,
          ),
          drawerTheme: const DrawerThemeData(
            backgroundColor: AppColors.darkBackgroundColor,
            shape: RoundedRectangleBorder(),
          ),
          elevatedButtonTheme: const ElevatedButtonThemeData(
              style: ButtonStyle(
            elevation: WidgetStatePropertyAll(1),
            padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0)),
            minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50.0)),
            maximumSize:
                WidgetStatePropertyAll(Size(double.infinity, double.infinity)),
            backgroundColor: WidgetStatePropertyAll(AppColors.darkCardColor),
            foregroundColor:
                WidgetStatePropertyAll(AppColors.darkSecondaryTextColor),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          )),
          textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
                  padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0)),
                  minimumSize:
                      WidgetStatePropertyAll(Size(double.infinity, 50.0)),
                  maximumSize: WidgetStatePropertyAll(
                      Size(double.infinity, double.infinity)),
                  backgroundColor:
                      WidgetStatePropertyAll(AppColors.darkCardColor),
                  foregroundColor:
                      WidgetStatePropertyAll(AppColors.darkSecondaryTextColor),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ))),
          iconButtonTheme: const IconButtonThemeData(
              style: ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.zero),
            iconSize: WidgetStatePropertyAll(20.0),
          )),
          textTheme: TextTheme(
            titleMedium: GoogleFonts.nunito(
              fontSize: 28,
              fontWeight: UiUtilities.semiBold,
              color: AppColors.primaryColor,
            ),
            labelLarge: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: UiUtilities.semiBold,
              color: AppColors.darkPrimaryTextColor,
            ),
            labelMedium: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: UiUtilities.semiBold,
              color: AppColors.darkPrimaryTextColor,
            ),
            labelSmall: GoogleFonts.nunito(
              fontSize: 14,
              fontWeight: UiUtilities.semiBold,
              color: AppColors.darkPrimaryTextColor,
            ),
            bodyLarge: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: AppColors.darkPrimaryTextColor,
            ),
            bodyMedium: GoogleFonts.nunito(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColors.darkPrimaryTextColor,
            ),
            bodySmall: GoogleFonts.nunito(
              fontSize: 10,
              fontWeight: FontWeight.normal,
              color: AppColors.darkPrimaryTextColor,
            ),
          ),
          extensions: [
            AppThemeColors.dark(),
          ]);
}
