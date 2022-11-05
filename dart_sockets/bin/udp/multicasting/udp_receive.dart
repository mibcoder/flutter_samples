import 'dart:io';

void main(List args)async{

  //Step#1 ----------------Creating socket-----------------
  //IP address on network
  final InternetAddress internetAddress = InternetAddress.anyIPv4; //InternetAddress("192.168.3.143");
  //Port on network
  final int port=4545;
  //Binding with socket(IP and port)
  RawDatagramSocket socket = await RawDatagramSocket.bind(internetAddress, port);

  //Step#2 ----------------Join Group-----------------
  socket.joinMulticast(InternetAddress('239.10.10.100'));
  print('Multicast joined');

  //Step#3 ------------Start listening a socket(IP,Port)---------------------
  print('Going to start listening a socket(${socket.address.address}:${socket.port})');
  socket.listen((RawSocketEvent event){
    Datagram? datagram = socket.receive();
    if (datagram == null) return;
    String message = String.fromCharCodes(datagram.data).trim();
    print('From ${datagram.address.address}:${datagram.port}, Message: $message');
  });

}