import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend_job_portal_application/http/http_service.dart';
import 'package:http/http.dart' as http;
import 'package:frontend_job_portal_application/extensions/extensions_export.dart';

class AuthHttpService {
  static final _baseUrl = dotenv.env["BASE_URL"];
  static Future<http.Response?> register(
    Map<String, dynamic> userDetails,
  ) async {
    try {
      var path = dotenv.env["USER_REGISTER_PATH"];

      if (_baseUrl.isNull || path.isNull) {
        throw Exception("Unable to get env values");
      }

      return await HttpService.post(
        url: _baseUrl! + path!,
        body: userDetails,
        headers: {
          'Content-Type': 'application/json',
        },
      );
    } catch (e) {
      debugPrint("Something went wrong on Register User Request:: $e");
    }
    return null;
  }

  static Future<http.Response?> login(
    Map<String, dynamic> userDetails,
  ) async {
    try {
      var path = dotenv.env["USER_LOGIN_PATH"];

      if (_baseUrl.isNull || path.isNull) {
        throw Exception("Unable to get env values");
      }

      return await HttpService.post(
        url: _baseUrl! + path!,
        body: userDetails,
        headers: {
          'Content-Type': 'application/json',
        },
      );
    } catch (e) {
      debugPrint("Something went wrong Login User Request :: $e");
    }
    return null;
  }
}
