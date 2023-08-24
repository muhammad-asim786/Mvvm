import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiServices.dart';
import 'package:mvvm/utils/utils.dart';

import '../res/app_urls.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      log('enter in try blocks');
      dynamic response = await _apiServices.postApiResponse(
          'https://reqres.in/api/users', data);
    } catch (e) {
      if (kDebugMode) {
        log('this is relevents error: $e');
      }
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.postApiResponse(AppUrls.registerUrlEndPoint, data);
    } catch (e) {
      rethrow;
    }
  }
}
