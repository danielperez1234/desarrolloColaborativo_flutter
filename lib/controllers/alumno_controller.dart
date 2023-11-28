/*import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:materia/controllers/paths.dart';
import 'package:materia/models/Alumno.dart';

class AlumnoContrller {
  Future<List<Alumno>> getAll() async {
    http.Response res =
        await http.get(Uri.parse(basePath + 'alumnos/'), headers: headers);
    var list = json.decode(res.body);
    List<Alumno> listaAlumnos = [];
    for (Map<String, dynamic> x in list) {
      listaAlumnos.add(Alumno.fromJson(x));
    }
    return listaAlumnos;
  }
}*/

import 'package:materia/models/Alumno.dart';
import 'package:materia/models/materia.dart';

var alumnosData = [
  Alumno(1, 'Peter', 'Osnaya', 'Derecho'),
  Alumno(2, 'María', 'López', 'Medicina'),
  Alumno(3, 'Juan', 'Martínez', 'Derecho'),
  Alumno(4, 'Laura', 'Hernández', 'Arquitectura'),
  Alumno(5, 'Pedro', 'Díaz', 'Psicología'),
  Alumno(6, 'Ana', 'Pérez', 'Economía'),
  Alumno(7, 'David', 'Gómez', 'Biología'),
  Alumno(8, 'Sofía', 'Rodríguez', 'Química'),
  Alumno(9, 'Javier', 'Fernández', 'Historia'),
  Alumno(10, 'Elena', 'Gutiérrez', 'Filosofía'),
  Alumno(11, 'Pablo', 'Sánchez', 'Matemáticas'),
  Alumno(12, 'Andrea', 'Torres', 'Física'),
];
List<Materia> materias = [
  Materia(
    id: 1,
    nombre: 'Matemáticas',
    descripcion: 'Curso avanzado de matemáticas aplicadas.',
  ),
  Materia(
    id: 2,
    nombre: 'Historia',
    descripcion: 'Estudio de la historia antigua y moderna.',
  ),
  Materia(
    id: 3,
    nombre: 'Literatura',
    descripcion: 'Análisis de obras literarias y géneros literarios.',
  ),
  Materia(
    id: 4,
    nombre: 'Biología',
    descripcion: 'Estudio de la vida y los seres vivos.',
  ),
  Materia(
    id: 5,
    nombre: 'Química',
    descripcion: 'Compuestos químicos y su comportamiento.',
  ),
  Materia(
    id: 6,
    nombre: 'Física',
    descripcion: 'Principios fundamentales de la física.',
  ),
  Materia(
    id: 7,
    nombre: 'Programación',
    descripcion: 'Introducción a la lógica y programación de computadoras.',
  ),
  Materia(
    id: 8,
    nombre: 'Arte',
    descripcion: 'Exploración de diferentes formas de expresión artística.',
  ),
  Materia(
    id: 9,
    nombre: 'Economía',
    descripcion: 'Conceptos básicos de economía y finanzas.',
  ),
  Materia(
    id: 10,
    nombre: 'Psicología',
    descripcion: 'Estudio de la mente y el comportamiento humano.',
  ),
  Materia(
    id: 11,
    nombre: 'Derecho',
    descripcion: 'Principios y leyes del sistema jurídico.',
  ),
  Materia(
    id: 12,
    nombre: 'Ingeniería',
    descripcion: 'Principios básicos de la ingeniería y sus ramas.',
  ),
];
List<DetalleMateria> detalles = [
  DetalleMateria(id: 1, idAlumno: 1, idMateria: 1, calificacion: 8.5),
  DetalleMateria(id: 2, idAlumno: 2, idMateria: 3, calificacion: 7.0),
  DetalleMateria(id: 3, idAlumno: 3, idMateria: 5, calificacion: 9.2),
  DetalleMateria(id: 4, idAlumno: 4, idMateria: 2, calificacion: 6.5),
  DetalleMateria(id: 5, idAlumno: 5, idMateria: 4, calificacion: 8.9),
  DetalleMateria(id: 6, idAlumno: 6, idMateria: 6, calificacion: 7.8),
  DetalleMateria(id: 7, idAlumno: 7, idMateria: 7, calificacion: 9.0),
  DetalleMateria(id: 8, idAlumno: 8, idMateria: 9, calificacion: 6.0),
  DetalleMateria(id: 9, idAlumno: 9, idMateria: 10, calificacion: 8.2),
  DetalleMateria(id: 10, idAlumno: 10, idMateria: 12, calificacion: 7.5),
  DetalleMateria(id: 11, idAlumno: 11, idMateria: 11, calificacion: 9.5),
  DetalleMateria(id: 12, idAlumno: 12, idMateria: 8, calificacion: 8.7),
  DetalleMateria(id: 13, idAlumno: 1, idMateria: 6, calificacion: 6.8),
  DetalleMateria(id: 14, idAlumno: 2, idMateria: 4, calificacion: 9.1),
  DetalleMateria(id: 15, idAlumno: 3, idMateria: 2, calificacion: 7.7),
];
