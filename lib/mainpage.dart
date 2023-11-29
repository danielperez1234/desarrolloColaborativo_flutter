import 'package:flutter/material.dart';
import 'package:materia/alumnos_list.dart';
import 'package:materia/materia_list.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('La Salle Bajío'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                padding: EdgeInsets.all(16.0),
                child: Image.asset('assets/images/final.jpg')),
            CardItem(
              backgroundColor: Colors.white,
              elevation: 4.0,
              image: 'assets/images/estudihambre.jpg',
              properties: ['Nombre: Juan', 'Edad: 20', 'Carrera: Ingeniería'],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentsListPage()),
                );
              },
            ),
            CardItem(
              backgroundColor: Colors.white,
              elevation: 4.0,
              textColor: Colors.blue,
              image: 'assets/images/encargada.jpeg',
              properties: [
                'Materia: Matemáticas',
                'Créditos: 8',
                'Nivel: Avanzado'
              ],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MateriasListPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String image;
  final List<String> properties;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final double? elevation;
  final Color? textColor;

  const CardItem({
    required this.image,
    required this.properties,
    required this.onTap,
    this.backgroundColor,
    this.elevation,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: elevation ?? 0.0,
        margin: EdgeInsets.all(16.0),
        color: backgroundColor,
        child: Column(
          children: [
            Image.asset(
              image,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: properties
                  .map((property) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          property,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: textColor ?? Colors.black,
                          ),
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }
}
