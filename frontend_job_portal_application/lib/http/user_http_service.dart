import 'package:ar_job_portal/http/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ar_job_portal/extensions/extensions_export.dart';
import 'package:http/http.dart' as http;

class UserHttpService {
  static final _baseUrl = dotenv.env["BASE_URL"];
  static final _path = dotenv.env["USER_PATH"];

  static Future<http.Response?> getUser({required String token}) async {
    try {
      if (_baseUrl.isNull || _path.isNull) {
        throw Exception("Unable to get env values");
      }

      return await HttpService.get(
        url: _baseUrl! + _path!,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
    } catch (e) {
      debugPrint('Something went wrong on getting user details');
    }
    return null;
  }
}
