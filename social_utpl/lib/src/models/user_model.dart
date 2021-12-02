class UserModel {
  int? idcuenta;
  String? nombre;
  String? apellido;
  String? usuario;
  String? email;
  String? token;
  String? contrasena;
  String? modalidad;
  int? idCarrera;
  UserModel(
      {this.idcuenta,
      this.nombre,
      this.apellido,
      this.usuario,
      this.email,
      this.token,
      this.contrasena,
      this.modalidad,
      this.idCarrera});

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
