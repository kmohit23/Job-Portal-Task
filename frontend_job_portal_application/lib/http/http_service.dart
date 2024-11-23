import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static var client = http.Client();

  static Future<http.Response> get({
    required String url,
    Map<String, String>? headers,
  }) async {
    http.Response response;
    try {
      response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
    } on SocketException catch (err) {
      response = _buildErrorResponse(
        msg: 'Please, check your internet connection.',
        error: 'Socket Exception: $err',
        isSocketException: true,
      );
    } catch (e) {
      response = _buildErrorResponse(
        msg: 'Something went wrong',
        error: 'Other Exception: $e',
      );
    }
    return response;
  }

  static Future<http.Response> getWithParams({
    required String url,
    required String params,
    Map<String, String>? headers,
  }) async {
    http.Response response;
    try {
      response = await http.get(
        Uri.parse('$url?$params'),
        headers: headers,
      );
    } on SocketException catch (err) {
      response = _buildErrorResponse(
        msg: 'Please, check your internet connection.',
        error: 'Socket Exception: $err',
        isSocketException: true,
      );
    } catch (e) {
      response = _buildErrorResponse(
        msg: 'Something went wrong',
        error: 'Other Exception: $e',
      );
    }
    return response;
  }

  static Future<http.Response> post({
    required String url,
    required Map<String, dynamic> body,
    required Map<String, String>? headers,
  }) async {
    http.Response response;
    try {
      response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );
    } on SocketException catch (err) {
      response = _buildErrorResponse(
        msg: 'Please, check your internet connection.',
        error: 'Socket Exception: $err',
        isSocketException: true,
      );
    } catch (e) {
      response = _buildErrorResponse(
        msg: 'Something went wrong',
        error: 'Other Exception: $e',
      );
    }
    return response;
  }

  static http.Response _buildErrorResponse({
    required String msg,
    required dynamic error,
    bool isSocketException = false,
  }) {
    debugPrint("Error Response  for http request :: Error ::$error");
    return http.Response(
      jsonEncode(
        {"error": msg, "detailedError": error},
      ),
      isSocketException ? 503 : 999,
    );
  }
}
