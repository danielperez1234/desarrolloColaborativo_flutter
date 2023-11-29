import 'package:flutter/material.dart';
import 'package:materia/asignar_materia.dart';
import 'package:materia/controllers/alumno_controller.dart';
import 'package:materia/models/Alumno.dart';
import 'package:materia/models/materia.dart';

// Assuming you have defined the Student class as mentioned earlier
class StudentDetailsPage extends StatefulWidget {
  Alumno student;
  final List<Materia> materiasInscritas; // Lista simulada de materias inscritas
  final List<DetalleMateria> detallesS;

  StudentDetailsPage(
      {required this.student,
      required this.materiasInscritas,
      required this.detallesS});

  @override
  State<StudentDetailsPage> createState() => _StudentDetailsPageState();
}

class _StudentDetailsPageState extends State<StudentDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () async {
              final nameC = TextEditingController();
              final apellidoC = TextEditingController();
              final carreraC = TextEditingController();
              await showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: Text('Editar'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: nameC,
                              decoration: InputDecoration(hintText: 'Nombre'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: apellidoC,
                              decoration: InputDecoration(hintText: 'Apellido'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: carreraC,
                              decoration: InputDecoration(hintText: 'Carrera'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                alumnosData[alumnosData.indexWhere((element) =>
                                        element.id == widget.student.id)] =
                                    Alumno(widget.student.id, nameC.text,
                                        apellidoC.text, carreraC.text);
                                widget.student = Alumno(widget.student.id,
                                    nameC.text, apellidoC.text, carreraC.text);
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
          SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              AsignarMateriaModal(widget.student.id)))
                  .then((value) {
                Navigator.pop(context);
              });
            },
            backgroundColor: Color(0xFF032059),
            child: Icon(Icons.account_balance_wallet_outlined),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('Detalles del Estudiante'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/images/logoSalleUp.png', // Replace with student's image path
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nombre: ${widget.student.nombre} ${widget.student.apellidos}',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Carrera: ${widget.student.carrera}',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      // Add more student details as needed
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Materias Inscritas:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: widget.detallesS.length,
                itemBuilder: (context, index) {
                  print('El que busco ' +
                      widget.detallesS[index].idMateria.toString());
                  final materia = widget.materiasInscritas.where((element) {
                    print(element.id);

                    return element.id == widget.detallesS[index].idMateria;
                  }).first;
                  return ListTile(
                    title: Text(materia.nombre),
                    subtitle: Text(
                        'Calificación: ${widget.detallesS[index].calificacion}'),
                    onTap: () async {
                      // Navigate to the detail page of the materia
                      TextEditingController controller =
                          TextEditingController();
                      await showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text('Asignar Calificación'),
                                content: TextField(
                                  controller: controller,
                                  keyboardType: TextInputType.number,
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        widget.detallesS[index].calificacion =
                                            double.tryParse(controller.text) ??
                                                0.0;
                                        Navigator.pop(context);
                                      },
                                      child: Text('agregar'))
                                ],
                              ));
                      setState(() {});
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
