import 'package:flutter/material.dart';
import 'package:materia/controllers/alumno_controller.dart';
import 'package:materia/models/materia.dart';

class MateriaDetailPage extends StatefulWidget {
  Materia materia;

  MateriaDetailPage({required this.materia});

  @override
  State<MateriaDetailPage> createState() => _MateriaDetailPageState();
}

class _MateriaDetailPageState extends State<MateriaDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nameC = TextEditingController();
          final descripcionC = TextEditingController();
          await showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text('Editar'),
                    content: Column(
                      children: [
                        TextField(
                          controller: nameC,
                          decoration: InputDecoration(hintText: 'Nombre'),
                        ),
                        TextField(
                          controller: descripcionC,
                          decoration: InputDecoration(hintText: 'Descripcion'),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            materias[materias.indexWhere((element) =>
                                    element.id == widget.materia.id)] =
                                Materia(
                                    id: widget.materia.id,
                                    nombre: nameC.text,
                                    descripcion: descripcionC.text);
                            widget.materia = Materia(
                                id: widget.materia.id,
                                nombre: nameC.text,
                                descripcion: descripcionC.text);
                            Navigator.pop(context);
                          },
                          child: Text('done'))
                    ],
                  ));
          setState(() {});
        },
        backgroundColor: Color(0xFF032059),
        child: Icon(Icons.edit),
      ),
      appBar: AppBar(
        title: Text('Detalle de Materia'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre: ${widget.materia.nombre}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Descripción: ${widget.materia.descripcion}',
              style: TextStyle(fontSize: 18),
            ),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
