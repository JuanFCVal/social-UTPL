import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:social_utpl/src/models/user_model.dart';
import 'dart:convert';

class UserProvider extends ChangeNotifier {
  bool _isLoading = false;
  late UserModel user = UserModel();
  final String api = "http://localhost:3000";

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  login(UserModel user) async {
    final url = Uri.parse(
        api + '/login_app?user=${user.usuario}&pass=${user.contrasena}');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    if (decodedData['status'] == '1') {
      user = UserModel.fromJson(decodedData['data']);
      return user;
    } else {
      return user;
    }
  }
}
