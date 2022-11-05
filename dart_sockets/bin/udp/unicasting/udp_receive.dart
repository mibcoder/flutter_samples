import 'dart:io';

import 'udp_send.dart';

void main() async{

  //Step#1 ----------------Creating socket-----------------
  //IP address on network
  final InternetAddress internetAddress = InternetAddress.anyIPv4; //InternetAddress("192.168.3.143");
  //Binding with socket(IP and port)
  RawDatagramSocket socket = await RawDatagramSocket.bind(internetAddress, uniCastPort);

  //Step#2 ------------Start listening a socket(IP,Port)---------------------
  print('Going to start listening a socket(${socket.address.address}:${socket.port})');
  socket.listen((RawSocketEvent event){
    Datagram? datagram = socket.receive();
    if (datagram == null) return;
    String message = String.fromCharCodes(datagram.data).trim();
    print('From ${datagram.address.address}:${datagram.port}, Message: $message');
  });

}