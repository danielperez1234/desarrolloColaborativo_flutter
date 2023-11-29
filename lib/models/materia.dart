class Materia {
  final int id;
  final String nombre;
  final String descripcion;

  Materia({
    required this.id,
    required this.nombre,
    required this.descripcion,
  });
}

class DetalleMateria {
  final int id;
  final int idAlumno;
  final int idMateria;
  double calificacion;

  DetalleMateria({
    required this.id,
    required this.idAlumno,
    required this.idMateria,
    required this.calificacion,
  });
}
