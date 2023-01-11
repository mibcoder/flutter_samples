import 'dart:io';
import 'dart:typed_data';

import 'tcp_server.dart';

void main()async{

  //Step#1 ----------------Creating socket-----------------
  //Binding with server socket(IP and port)
  final Socket socket = await Socket.connect(internetAddress.host, tcpPort);
  print('Connecting to ${internetAddress.host}:$tcpPort');

  //Step#2 ------------listen server socket---------------------
  socket.listen(

    // handle data from the server
    (Uint8List data) {
      final serverResponse = String.fromCharCodes(data);
      print('Message from server: $serverResponse');
    },

    // handle errors
    onError: (error) {
      print(error);
      print('Server error: $error');
      socket.destroy();
    },

    // handle server ending connection
    onDone: () {
      print('Server close.');
      socket.destroy();
    },

  );

  //Step#3 ------------send message on socket---------------------
  print('Sending from ${socket.address.address}:${socket.port}');
  socket.write("I'm tcp client");
  await Future.delayed(Duration(seconds: 2));
}