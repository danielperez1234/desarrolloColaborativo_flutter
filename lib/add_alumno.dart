import 'package:flutter/material.dart';
import 'package:materia/controllers/alumno_controller.dart';
import 'package:materia/models/Alumno.dart';

class AddStudentPage extends StatefulWidget {
  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _careerController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _careerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Alumno'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombre del Alumno'),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Apellido'),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 12),
            TextField(
              controller: _careerController,
              decoration: InputDecoration(labelText: 'Carrera'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xFF032059))),
              onPressed: () {
                // Save or process student data here
                String name = _nameController.text;
                String apellido = _ageController.text;
                String career = _careerController.text;

                // You can perform actions with this data, like saving to a database
                // For now, let's just print the student information
                alumnosData.add(
                    Alumno(alumnosData.last.id + 1, name, apellido, career));
                Navigator.pop(context);
                // Optionally, you can navigate back after adding the student
                // Navigator.pop(context);
              },
              child: Text('Agregar Alumno'),
            ),
          ],
        ),
      ),
    );
  }
}
