class ChatMessage {
  final int idPerson;
  final String mensaje;
  final int idChat;
  final String nombres;
  late final bool visto; // Nuevo atributo
  final DateTime fechaRegistro; // Nuevo atributo

  ChatMessage({
    required this.idPerson,
    required this.mensaje,
    required this.idChat,
    required this.nombres,
    required this.visto, // Agregado
    required this.fechaRegistro, // Agregado
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    try {
      return ChatMessage(
        idPerson: json['idPerson'],
        mensaje: json['mensaje'],
        idChat: json['idChat'],
        nombres: json['Nombres'],
        // Conversión de entero a booleano para el campo 'visto'
        visto: (json['visto'] is int)
            ? json['visto'] == 1
            : (json['visto'] ?? false),
        fechaRegistro: DateTime.parse(json['fechaRegistro']),
      );
    } catch (e) {
      print('Error al convertir ChatMessage: $e');
      throw Exception('Error en los datos del mensaje');
    }
  }

  @override
  String toString() {
    return 'ChatMessage(idPerson: $idPerson, mensaje: $mensaje, idChat: $idChat, nombres: $nombres, visto: $visto, fechaRegistro: $fechaRegistro)';
  }
}
