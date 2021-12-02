class Carreras {
  List<Carrera> items = [];
  Carreras();
  Carreras.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final categoria = new Carrera.fromJson(item);
      items.add(categoria);
    }
  }
}

class Carrera {
  Carrera({
    this.idcarrera,
    this.nombre,
  });

  int? idcarrera;
  String? nombre;

  factory Carrera.fromJson(Map<String, dynamic> json) => Carrera(
        idcarrera: json["idcarrera"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "idcarrera": idcarrera,
        "nombre": nombre,
      };
}
