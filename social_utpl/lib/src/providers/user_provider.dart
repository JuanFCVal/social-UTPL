import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:social_utpl/src/models/career.dart';
import 'package:social_utpl/src/models/user_model.dart';
import 'dart:convert';

class UserProvider extends ChangeNotifier {
  bool _isLoading = false;
  late UserModel user = UserModel();
  late Carreras carreras = Carreras();

  final String api = "http://localhost:3000";
  UserProvider() {
    getCategory();
  }
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
      print(user.nombre);
      return user;
    } else {
      return user;
    }
  }

  createUser(UserModel tempUser, Carrera carrera) async {
    final url = Uri.parse(api + '/registrar_usuario_app');
    final encodeResp = jsonEncode({
      "nombre": tempUser.nombre,
      "apellido": tempUser.apellido,
      "usuario": tempUser.usuario,
      "contrasena": tempUser.contrasena,
      "email": tempUser.email,
      "idCarrera": carrera.idcarrera
    });
    try {
      final resp = await http.post(url,
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: encodeResp);
      final decodedData = json.decode(resp.body);
      print(decodedData['status']);
      if (decodedData['status'] == '1') {
        return true;
      } else if (decodedData['status'] == '0') {
        return false;
      }
    } catch (e) {
      debugPrint("Huno un error");
      return false;
    }
  }

  getCategory() async {
    try {
      final url = Uri.parse(api + '/carreras');
      final resp = await http.get(url);
      final decodedData = json.decode(resp.body);
      if (decodedData['status'] == '1') {
        carreras = Carreras.fromJsonList(decodedData['data']);
      } else {
        carreras.items = [];
      }
    } catch (e) {
      debugPrint("Huno un error");
    }
  }
}
