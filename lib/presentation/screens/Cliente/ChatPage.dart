import 'dart:io';

import 'package:fluttapp/Implementation/ChatImp.dart';
import 'package:fluttapp/Models/ChatModel.dart';
import 'package:fluttapp/presentation/services/services_firebase.dart';
import 'package:fluttapp/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Móvil',
      theme: ThemeData(
        primarySwatch: myColorMaterial,
      ),
      home: ChatPage(
        idChat: 0,
        nombreChat: '',
        idPersonDestino: 0,
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  final int idChat;
  final String nombreChat;
  final int idPersonDestino;
  final File? imageChat;

  ChatPage(
      {required this.idChat,
      required this.nombreChat,
      required this.idPersonDestino,
      this.imageChat});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ScrollController _scrollController = ScrollController();
  bool isLoadingMessages = false;
  TextStyle styleNombreMensaje = TextStyle(
    color: Colors.grey[350],
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    shadows: [
      Shadow(
        blurRadius: 2.0,
        color: Colors.black38,
        offset: Offset(1.0, 1.0),
      ),
    ],
  );

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    currentChatId = widget.idChat;

    fetchMessage(widget.idChat).then((value) {
      if (mounted) {
        setState(() {
          messages = value;
          messages = messages.reversed.toList();
          print("Mensajes cargados: ${messages.toString()}");
          print("ID del miembro actual: ${miembroActual!.id}");
          isLoadingMessages = true;
        });
      }
    });

    socket.on('chat message', (data) async {
      print("Datos recibidos del socket: $data"); // Imprime los datos recibidos
      int chatId = widget.idChat;
      if (mounted) {
        setState(() {
          if (chatId == data[3]) {
            messages.insert(
              0,
              ChatMessage(
                idPerson: data[0],
                mensaje: data[1],
                idChat: chatId,
                nombres: data[2],
                visto:
                    false, // Asigna un valor predeterminado o basado en tu lógica
                fechaRegistro:
                    DateTime.now(), // O la fecha que recibas del servidor
              ),
            );
            print(
                "Mensaje agregado: ${data[1]}"); // Imprime el mensaje agregado
          } else {
            print("El ID del chat no coincide: $chatId != ${data[3]}");
          }
        });
        _scrollController.animateTo(
          0.0,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    currentChatId = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5C8ECB),
      appBar: AppBar(
        backgroundColor: Color(0xFF5C8ECB),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: widget.imageChat != null
                  ? FileImage(widget.imageChat!)
                  : AssetImage('assets/usuario.png') as ImageProvider,
            ),
            SizedBox(
              width: 20,
            ),
            Text(widget.nombreChat, style: TextStyle(color: Colors.white)),
          ],
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: isLoadingMessages
          ? Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _scrollController,
                    padding: EdgeInsets.all(10.0),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 9.0),
                        child: Column(
                          crossAxisAlignment: widget.idPersonDestino != 0
                              ? (messages[index].idPerson !=
                                      widget.idPersonDestino
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start)
                              : (messages[index].idPerson == miembroActual!.id
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start),
                          children: <Widget>[
                            widget.idPersonDestino != 0
                                ? (messages[index].idPerson !=
                                            widget.idPersonDestino &&
                                        messages[index].idPerson ==
                                            miembroActual!.id
                                    ? Text('Yo', style: styleNombreMensaje)
                                    : Text(messages[index].nombres,
                                        style: styleNombreMensaje))
                                : (messages[index].idPerson == miembroActual!.id
                                    ? Text('Yo', style: styleNombreMensaje)
                                    : Text(messages[index].nombres,
                                        style: styleNombreMensaje)),
                            Card(
                              color: widget.idPersonDestino != 0
                                  ? (messages[index].idPerson !=
                                          widget.idPersonDestino
                                      ? Colors.green
                                      : Colors.white)
                                  : (messages[index].idPerson ==
                                          miembroActual!.id
                                      ? Colors.green
                                      : Colors.white),
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17.0),
                              ),
                              child: Stack(
                                children: [
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                              0.8,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 28.0,
                                        vertical: 16.0,
                                      ),
                                      child: Text(
                                        messages[index].mensaje,
                                        style: TextStyle(
                                          color: widget.idPersonDestino != 0
                                              ? (messages[index].idPerson !=
                                                      widget.idPersonDestino
                                                  ? Colors.white
                                                  : Colors.black)
                                              : (messages[index].idPerson ==
                                                      miembroActual!.id
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -3,
                                    right: 5,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5.0),
                                          child: Text(
                                            // Extrae la hora y los minutos de fechaRegistro
                                            '${messages[index].fechaRegistro.hour.toString().padLeft(2, '0')}:${messages[index].fechaRegistro.minute.toString().padLeft(2, '0')}',
                                            style: TextStyle(
                                              fontSize: 9,
                                              color: Color.fromARGB(
                                                  255, 39, 39, 39),
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          'assets/doblePalomaNoVisto.png',
                                          width: 18,
                                          height: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          style: TextStyle(color: Color(0xFF4D6596)),
                          decoration: InputDecoration(
                            hintText: 'Escribe un mensaje...',
                            hintStyle: TextStyle(
                                color: Color(0xFF4D6596).withOpacity(0.7)),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF5C8ECB), width: 1.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send, color: Colors.white),
                        onPressed: () async {
                          if (_controller.text.isNotEmpty) {
                            await sendMessage(miembroActual!.id,
                                _controller.text, widget.idChat);
                            print(
                                "Mensaje enviado: ${_controller.text}"); // Imprime el mensaje enviado
                            _controller.clear();
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            )
          : Center(
              child: SpinKitCircle(
                color: Colors.white,
                size: 50.0,
              ),
            ),
    );
  }
}
