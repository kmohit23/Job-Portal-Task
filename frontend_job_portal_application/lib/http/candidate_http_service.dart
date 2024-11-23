import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend_job_portal_application/http/http_service.dart';
import 'package:frontend_job_portal_application/extensions/extensions_export.dart';
import 'package:http/http.dart' as http;

class CandidateHttpService {
  static final _baseUrl = dotenv.env["BASE_URl"];
  static final _path = dotenv.env["CANDIDATE_PATH"];
  static Future<http.Response?> create(
      {required Map<String, dynamic> body, required String token}) async {
    try {
      if (_baseUrl.isNull || _path.isNull) {
        throw Exception("Unable to get env values");
      }
      return await HttpService.post(
        url: _baseUrl! + _path!,
        body: body,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
    } catch (e) {
      debugPrint("Something went wrong on Create Request of Candidate:: $e");
    }
    return null;
  }

  static Future<http.Response?> getAll({required token}) async {
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
      debugPrint("Something went wrong on Get All Request of Candidate :: $e");
    }
    return null;
  }

  Future<http.Response?> get({required paramId, required token}) async {
    try {
      if (_baseUrl.isNull || _path.isNull) {
        throw Exception("Unable to get env values");
      }
      return await HttpService.getWithParams(
        url: _baseUrl! + _path!,
        params: paramId,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
    } catch (e) {
      debugPrint("Something went wrong on Get  Request of Candidate :: $e");
    }
    return null;
  }
}
