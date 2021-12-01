import 'package:flutter/cupertino.dart';

class UserModel {
  int? idcuenta;
  String? nombre;
  String? apellido;
  String? usuario;
  String? email;
  String? token;
  String? contrasena;
  UserModel({
    this.idcuenta,
    this.nombre,
    this.apellido,
    this.usuario,
    this.email,
    this.token,
    this.contrasena,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    idcuenta = json['idcuenta'];
    nombre = json['nombre'];
    apellido = json['apellido'];
    usuario = json['usuario'];
    email = json['email'];
    token = json['token'];
    contrasena = json['contrasena'];
  }
}
