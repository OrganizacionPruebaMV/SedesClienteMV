class Mascota {
  int idMascotas;
  String nombre;
  String raza;
  int edad;
  String color;
  String descripcion;
  int idPersona;
  String sexo;
  String especie;
  int castrado;
  int vacunado;
  DateTime? fechaUltimaVacuna;

  Mascota({
    required this.idMascotas,
    required this.nombre,
    required this.raza,
    required this.edad,
    required this.color,
    required this.descripcion,
    required this.idPersona,
    required this.sexo,
    required this.especie,
    required this.castrado,
    required this.vacunado,
    required this.fechaUltimaVacuna, 
    
  });

  factory Mascota.fromJson(Map<String, dynamic> json) {
    return Mascota(
      idMascotas: json['idMascotas'],
      nombre: json['Nombre'],
      raza: json['Raza'],
      edad: json['Edad'],
      color: json['Color'],
      descripcion: json['Descripcion'],
      idPersona: json['IdPersona'],
      sexo: json['Sexo'],
      especie: json['Especie'],
      castrado: json['Castrado'],
      vacunado: json['vacunado'] ?? 0,
      fechaUltimaVacuna: json['FechaUltimaVacuna']!=null? DateTime.parse(json['FechaUltimaVacuna']):null, 
    );
  }
}
