import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel extends ChangeNotifier {
  final _myRepo = AuthRepository();

  Future<dynamic> loginApi(dynamic data, BuildContext context) async {
    try {
      _myRepo.loginApi(data);
    } catch (e) {
      Utils.show_Custom_Flushbar(e.toString(), context);
    }
  }
}
