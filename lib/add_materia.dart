import 'package:flutter/material.dart';
import 'package:materia/controllers/alumno_controller.dart';
import 'package:materia/models/materia.dart';

class AddMateriaPage extends StatefulWidget {
  @override
  _AddMateriaPageState createState() => _AddMateriaPageState();
}

class _AddMateriaPageState extends State<AddMateriaPage> {
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _descripcionController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Materia'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(labelText: 'Nombre de la Materia'),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _descripcionController,
              decoration: InputDecoration(labelText: 'Descripción'),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xFF032059))),
              onPressed: () {
                // Save or process materia data here
                String nombre = _nombreController.text;
                String descripcion = _descripcionController.text;

                // You can perform actions with this data, like saving to a database
                // For now, let's just print the materia information
                print(
                    'Nombre de la materia: $nombre, Descripción: $descripcion');
                materias.add(Materia(
                    id: materias.last.id + 1,
                    nombre: nombre,
                    descripcion: descripcion));
                Navigator.pop(context);
                // Optionally, you can navigate back after adding the materia
                // Navigator.pop(context);
              },
              child: Text('Agregar Materia'),
            ),
          ],
        ),
      ),
    );
  }
}
