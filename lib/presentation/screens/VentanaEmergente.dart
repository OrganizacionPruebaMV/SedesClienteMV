import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Qualification.dart';

class VerCamapanas extends StatefulWidget {
  const VerCamapanas({super.key});

  @override
  _VerCamapanasState createState() => _VerCamapanasState();
}

class _VerCamapanasState extends State<VerCamapanas> {
  List<Marker> lstMarcadores = [];
  late GoogleMapController controlMapa;

  @override
  void initState() {
    super.initState();
    // Inicializar los marcadores
    _crearMarcadores();
  }

  void _crearMarcadores() {
    lstMarcadores = [
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(-17.3895000, -66.1568000),
        infoWindow: InfoWindow(
          title: 'Punto de Vacunación',
          snippet: 'Cierra a las 18:00',
          onTap: () {
            _mostrarVentanaEmergente();
          },
        ),
      ),
    ];
  }

  void _mostrarVentanaEmergente() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Punto de Vacunación',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Abierto - Cierra a las 18:00'),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CalificarServicioScreen()),
                  );
                },
                child: Text('Calificar Servicio'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5C8ECB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ver Campañas"),
        backgroundColor: Color(0xFF5C8ECB),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-17.3895000, -66.1568000),
          zoom: 14.5,
        ),
        markers: Set<Marker>.of(lstMarcadores),
        onMapCreated: (GoogleMapController controller) {
          controlMapa = controller;
        },
      ),
    );
  }
}
