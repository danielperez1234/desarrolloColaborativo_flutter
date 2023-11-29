class Alumno {
  int id;
  String nombre;
  String apellidos;
  String carrera;

  Alumno(this.id, this.nombre, this.apellidos, this.carrera);
  factory Alumno.fromJson(Map<String, dynamic> json) {
    return Alumno(
        json['id'], json['nombre'], json['apellidos'], json['carrera']);
  }
}
