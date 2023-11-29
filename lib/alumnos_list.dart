import 'package:flutter/material.dart';
import 'package:materia/add_alumno.dart';
import 'package:materia/controllers/alumno_controller.dart';
import 'package:materia/models/Alumno.dart';
import 'package:materia/student_detail.dart';

class StudentsListPage extends StatefulWidget {
  @override
  State<StudentsListPage> createState() => _StudentsListPageState();
}

class _StudentsListPageState extends State<StudentsListPage> {
  List<Alumno> students = [];
  fillstudents() async {
    students.clear();
    students.addAll(alumnosData);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fillstudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AddStudentPage()))
              .then((value) {
            fillstudents();
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF8C203D),
      ),
      appBar: AppBar(
        title: Text('Lista de Alumnos'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.white,
            margin: EdgeInsets.all(16.0),
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(),
              title: Text(
                students[index].nombre,
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: Text(
                'Apellido: ${students[index].apellidos}, Carrera: ${students[index].carrera}',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentDetailsPage(
                            student: students[index],
                            materiasInscritas: materias
                                .where((element) => detalles
                                    .where((element) =>
                                        element.idAlumno == students[index].id)
                                    .any((x) => x.idMateria == element.id))
                                .toList(),
                            detallesS: detalles
                                .where((element) =>
                                    element.idAlumno == students[index].id)
                                .toList(),
                          )),
                ).then((value) {
                  fillstudents();
                });
              },
            ),
          );
        },
      ),
    );
  }
}
