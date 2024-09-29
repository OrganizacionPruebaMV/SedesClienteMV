import 'package:flutter/material.dart';
import 'DashboardScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset('assets/LogoMaypiVac.png', height: 300, width: 400),
              SizedBox(height: screenHeight * 0.02),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Correo Electrónico',
                  border: UnderlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: UnderlineInputBorder(),
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '¡Regístrate!',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Iniciar Sesión',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4673C6),
                  minimumSize: Size(200, 50),
                ),
              ),
              SizedBox(height: 15),
              Text('O continuar con:',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              ElevatedButton.icon(
                icon: Image.asset('assets/descarga.png', height: 24),
                label: Text(
                  'Continuar con Google',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: BorderSide(color: Colors.black, width: 2),
                  minimumSize: Size(230, 50),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton.icon(
                icon: Image.asset('assets/LogoInvitado.webp', height: 24),
                label: Text(
                  'Continuar como invitado',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DashboardScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: BorderSide(color: Colors.black, width: 2),
                  minimumSize: Size(160, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
