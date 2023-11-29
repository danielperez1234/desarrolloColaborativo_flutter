import 'package:flutter/material.dart';
import 'package:materia/controllers/alumno_controller.dart';
import 'package:materia/models/materia.dart';

class AsignarMateriaModal extends StatefulWidget {
  AsignarMateriaModal(this.alumno);
  int alumno;
  @override
  _AsignarMateriaModalState createState() => _AsignarMateriaModalState();
}

class _AsignarMateriaModalState extends State<AsignarMateriaModal> {
  int selectedMateria = 0; // Variable para almacenar la materia seleccionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Asignar Materia',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            DropdownButton<int>(
              value: selectedMateria == 0 ? null : selectedMateria,
              onChanged: (int? newValue) {
                setState(() {
                  selectedMateria = newValue!;
                });
              },
              items: materias.map<DropdownMenuItem<int>>((Materia value) {
                return DropdownMenuItem<int>(
                  value: value.id,
                  child: Text(value.nombre),
                );
              }).toList(),
              hint: Text('Selecciona una materia'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedMateria != 0) {
                  // Simulate assigning the material (print message)
                  detalles.add(DetalleMateria(
                      id: detalles.last.id,
                      idAlumno: widget.alumno,
                      idMateria: selectedMateria,
                      calificacion: 0));
                  Navigator.pop(context); // Close the modal
                } else {
                  // Show an error message or handle empty selection
                  print('Por favor, selecciona una materia');
                }
              },
              child: Text('Asignar'),
            ),
          ],
        ),
      ),
    );
  }
}
