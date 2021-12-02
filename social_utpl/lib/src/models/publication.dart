import 'dart:convert';

import 'package:social_utpl/src/models/user_model.dart';

class Publication {
  Publication({
    this.idpublicacion,
    this.titulo,
    this.descripcion,
    this.idEstudiante,
    this.img,
    this.estudiante,
  });

  int? idpublicacion;
  String? titulo;
  String? descripcion;
  int? idEstudiante;
  String? img;
  UserModel? estudiante;

  factory Publication.fromJson(Map<String, dynamic> json) => Publication(
        idpublicacion: json["idpublicacion"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        idEstudiante: json["idEstudiante"],
        img: json["img"] == null ? null : json["img"],
      );

  Map<String, dynamic> toJson() => {
        "idpublicacion": idpublicacion,
        "titulo": titulo,
        "descripcion": descripcion,
        "idEstudiante": idEstudiante,
        "img": img ?? "",
      };
}
