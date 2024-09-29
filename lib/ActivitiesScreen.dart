import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importa intl para usar DateFormat
import 'MapaCBBA.dart';

class ActivitiesScreen extends StatelessWidget {
  ActivitiesScreen({Key? key}) : super(key: key);

  final List<String> options = [
    "Vacuna",
    "Carnetización",
    "Control de Foco",
    "Vacunación Continua",
    "Rastrillaje"
  ];

  String dropdownValue = "Vacuna"; // Valor inicial del Dropdown

  // Calcula la fecha de mañana
  final String tomorrowDate =
      DateFormat('dd/MM/yyyy').format(DateTime.now().add(Duration(days: 1)));

  final String endDate = DateFormat('dd/MM/yyyy')
      .format(DateTime(DateTime.now().year, DateTime.now().month + 1, 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Actividades",
            style: TextStyle(
                color: Colors.blue[900], // Azul más oscuro
                fontSize: 24, // Tamaño de fuente más grande
                fontWeight: FontWeight.bold // Texto en negrita
                )),
        backgroundColor:
            Color.fromARGB(255, 196, 215, 253), // Un fondo más claro
        centerTitle: true, // Asegura que el título esté centrado
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.blue[
                  900]), // Icono de flecha atrás en azul oscuro para contraste
          onPressed: () => Navigator.of(context)
              .pop(), // Función para volver a la pantalla anterior
        ),
      ),
      backgroundColor: Colors.white, // Fondo blanco del body
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Buscar',
                prefixIcon: Icon(Icons.search, color: Colors.blue.shade800),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                      BorderSide(color: Colors.blue.shade800, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                      BorderSide(color: Colors.blue.shade800, width: 2.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: dropdownValue,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                      BorderSide(color: Colors.blue.shade800, width: 2.0),
                ),
              ),
              icon: const Icon(Icons.arrow_drop_down, color: Colors.blue),
              elevation: 16,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16), // Texto negro y tamaño más grande
              onChanged: (String? newValue) {
                if (newValue != null) {
                  dropdownValue = newValue;
                }
              },
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Color de fondo del botón
                foregroundColor:
                    Colors.blue.shade800, // Color del texto e íconos
                side:
                    BorderSide(color: Colors.blue.shade800, width: 2), // Borde
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MapaCBBA()));
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Vacunación',
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                    Text('Campaña',
                        style: TextStyle(fontSize: 14, color: Colors.black)),
                    Text('$tomorrowDate - $endDate',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black)), // Fechas ajustadas
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
