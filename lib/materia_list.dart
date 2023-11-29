import 'package:flutter/material.dart';
import 'package:materia/add_materia.dart';
import 'package:materia/controllers/alumno_controller.dart';
import 'package:materia/material_detail.dart';

class MateriasListPage extends StatefulWidget {
  MateriasListPage();

  @override
  State<MateriasListPage> createState() => _MateriasListPageState();
}

class _MateriasListPageState extends State<MateriasListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AddMateriaPage()))
              .then((value) {
            setState(() {});
          });
        },
        backgroundColor: Color(0xFF8C203D),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Lista de Materias'),
      ),
      body: ListView.builder(
        itemCount: materias.length,
        itemBuilder: (context, index) {
          final materia = materias[index];

          return Card(
            color: Colors.white,
            elevation: 4.0,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(materia.nombre),
              subtitle: Text(materia.descripcion),
              onTap: () async {
                await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                MateriaDetailPage(materia: materia)))
                    .then((value) {});
                setState(() {});
                // Implement onTap functionality, e.g., navigate to details page
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => MateriaDetailPage(materia: materia),
                //   ),
                // );
              },
            ),
          );
        },
      ),
    );
  }
}
