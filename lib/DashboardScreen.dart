import 'package:flutter/material.dart';
import 'package:pruebaa/ActivitiesScreen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 10),
            Image.asset('assets/Univallenavbar.png', height: 30),
            Spacer(),
            Image.asset('assets/LogoU.png', height: 30),
            SizedBox(width: 10),
          ],
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor: Color.fromARGB(255, 196, 215, 253),
      ),

      drawer: Drawer(
        backgroundColor: Colors.white, // Fondo blanco del body
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFF1F5FD),
              ),
              child: Text(
                'Opciones',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Casa'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Usuario'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuraciones'),
              onTap: () {},
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white, // Fondo blanco del body
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Spacer(),
            createGridItem(Icons.pets, "Mis Mascotas", context),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                createGridItem(Icons.assignment, "Ver Actividades", context),
                createGridItem(Icons.edit, "Editar Perfil", context),
              ],
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción del botón QR
          print("Botón QR presionado");
        },
        child: Icon(Icons.qr_code), // Icono de QR
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget createGridItem(IconData icon, String title, BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Color(0xFFF1F5FD),
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: Icon(icon, size: 80, color: Colors.blue),
            onPressed: () {
              if (title == "Ver Actividades") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ActivitiesScreen()));
              } else {
                print("Presionado: $title");
              }
            },
          ),
        ),
        SizedBox(height: 8),
        Text(title,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
      ],
    );
  }
}
