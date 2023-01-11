import 'dart:io';
import 'dart:typed_data';

//Port on network
final int tcpPort=4567;
//IP address on network
final InternetAddress internetAddress = InternetAddress.anyIPv4; //InternetAddress("192.168.3.143");

void main() async {

  //Step#1 ----------------Creating socket-----------------

  //Binding with socket(IP and port)
  ServerSocket server = await ServerSocket.bind(internetAddress, tcpPort);
  print('Going to start listening a socket: ${server.address.address}:${server.port}');

  //Step#2 ------------Start listening a socket(IP,Port)---------------------
  server.listen((Socket socket) {

    //Client address
    print('Getting message from a socket: ${socket.remoteAddress.address}:${socket.remotePort}');

    //Step#3 ------------Start listening to client data---------------------
    socket.listen(
      //data from the client
      (Uint8List data) async {
        final message = String.fromCharCodes(data);
        print('Message from client: $message');
        socket.write("Hi, thanks for contacting, I'm server");
        socket.close();
      },

      //errors will be here
      onError: (error) {
        socket.close();
      },

      //on success
      onDone: () {
        socket.close();
      },

    );

  });

}