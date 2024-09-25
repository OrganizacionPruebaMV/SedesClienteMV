import 'package:flutter/material.dart';

class MapaCBBA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue[900]),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Image.asset('assets/Univallenavbar.png', height: 50),
        backgroundColor: Color.fromARGB(255, 196, 215, 253),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Text("Centros de Vacunación", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar por nombre...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.blue.shade300),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            left: 10,
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: () {}, // Acción para el primer botón
                  child: Icon(Icons.map), // Icono del primer botón
                  backgroundColor: Colors.green,
                ),
                SizedBox(height: 10), // Espacio entre botones
                FloatingActionButton(
                  onPressed: () {}, // Acción para el segundo botón
                  child: Icon(Icons.place), // Icono del segundo botón
                  backgroundColor: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/MarcaDepartamental.png', height: 50),
            Image.asset('assets/LogoSede.png', height: 50),
          ],
        ),
      ),
    );
  }
}
