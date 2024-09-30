import 'package:flutter/material.dart';

//IMPORTAR LOS NOMBRES DE LAS
//import 'home.dart';
//import 'perfil.dart'; 
//import 'mascota.dart';
//import 'campaña.dart';
//import 'compartir.dart';
//import 'calificar.dart';


class MainScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const MainScaffold({Key? key, required this.title, required this.body}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      /*drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF07E3EB),
              ),
              child: const Text(
                'Menú',
                style: TextStyle(
                  color: Color(0xFF262727),
                  fontSize: 24,
                ),
              ),
            ),


            
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home()), 
                );
              },
            ),



             ListTile(
              leading: Icon(Icons.pets_rounded),
              title: const Text('Mi Mascota'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mascota()), 
                );
              },
            ),


            
            ListTile(
              leading: Icon(Icons.archive),
              title: const Text('Campañas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Campana()), 
                );
              },
            ),




            ListTile(
              leading: Icon(Icons.share),
              title: const Text('Compartir'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Compartir()), 
                );
              },
            ),





            ListTile(
              leading: Icon(Icons.star),
              title: const Text('Calificanos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Calificar()), 
                );
              },
            ),


            
            
          ],
        ),
      ),*/
      body: body, 
    );
  }
}
