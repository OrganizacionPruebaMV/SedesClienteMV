import 'dart:convert';
import 'package:fluttapp/Config/Config.dart';
import 'package:fluttapp/Models/Conversation.dart';
import 'package:fluttapp/presentation/services/services_firebase.dart';
import 'package:http/http.dart' as http;



Future<List<Chat>> fetchChats() async {
  final response = await http.get(Uri.parse(
      '${Config.baseUrl}/getchats/' +
          miembroActual!.id.toString()));
  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Chat.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load chats');
  }
}


Future<List<Chat>> fetchChatsClient() async {
  final response = await http.get(Uri.parse(
      '${Config.baseUrl}/getchatcliente/' +
          miembroActual!.id.toString()));
  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Chat.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load chats');
  }
}


Future<List<dynamic>> fetchNamesPersonDestino(int idPersonDestino) async {
  final response = await http.get(Uri.parse(
      '${Config.baseUrl}/getnamespersondestino/' + 
          idPersonDestino.toString()));
  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse;
  } else {
    throw Exception('Failed to load chats');
  }
}
