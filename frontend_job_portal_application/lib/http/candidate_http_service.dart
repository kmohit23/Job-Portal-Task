import 'dart:convert';

import 'package:ar_job_portal/models/candidate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ar_job_portal/http/http_service.dart';
import 'package:ar_job_portal/extensions/extensions_export.dart';
import 'package:http/http.dart' as http;

class CandidateHttpService {
  static final _baseUrl = dotenv.env["BASE_URL"];
  static final _path = dotenv.env["CANDIDATE_PATH"];
  static Future<http.Response?> create({
    required CandidateModel candidate,
    required String token,
  }) async {
    try {
      if (_baseUrl.isNull || _path.isNull) {
        throw Exception("Unable to get env values");
      }

      var body = {
        "name": candidate.name,
        "email": candidate.email,
        "contact": candidate.contact,
        "job_role": candidate.jobRole,
        "education": candidate.education,
      };

      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      return await HttpService.post(
          url: _baseUrl! + _path!, body: body, headers: headers);
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

  static Future<http.Response?> getById(
      {required paramId, required token}) async {
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

  static Future<CandidateModel?> uploadFileOfCandidate(
      {required String file,
      required String fieldName,
      required String token}) async {
    try {
      var url = Uri.parse(_baseUrl! + dotenv.env["UPLOAD_PATH"]!);

      var request = http.MultipartRequest("POST", url);
      http.MultipartFile resultFile = await http.MultipartFile.fromPath(
        fieldName,
        file,
      );
      request.headers.addAll({
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      });
      request.files.add(resultFile);
      var response = await request.send();
      final responseData = await response.stream.bytesToString();
      var decodedData = jsonDecode(responseData);
      if (response.statusCode == 200) {
        CandidateModel candidate =
            CandidateModel.fromJson(decodedData["result"]);
        return candidate;
      }
      debugPrint(decodedData["message"]);
    } catch (e) {
      debugPrint("Something went wrong while upload $fieldName :: $e");
    }
    return null;
  }
}
