class Carreras {
  List<Carrera> items = [];
  Carreras();
  Carreras.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final career = Carrera.fromJson(item);
      items.add(career);
    }
  }

  getNames() {
    List names = [];
    for (var item in items) names.add(item.nombre);
    print(names);
    return names;
  }
}

class Carrera {
  Carrera({
    this.idcarrera,
    this.nombre,
  });

  int? idcarrera;
  String? nombre;

  get Nombre => nombre;

  factory Carrera.fromJson(Map<String, dynamic> json) => Carrera(
        idcarrera: json["idcarrera"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "idcarrera": idcarrera,
        "nombre": nombre,
      };
}
