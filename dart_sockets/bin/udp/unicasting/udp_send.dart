import 'dart:io';

//Port on network
final int uniCastPort=4444;

void main()async{

  //Step#1 ----------------Creating socket-----------------
  //IP address on network
  final InternetAddress internetAddress = InternetAddress.anyIPv4; //InternetAddress("192.168.3.143");
  //Port on network
  final int port=0;
  //Binding with socket(IP and port)
  RawDatagramSocket socket = await RawDatagramSocket.bind(internetAddress, port);

  //Step#2 ------------send message on socket---------------------
  print('Sending from ${socket.address.address}:${socket.port}');
  socket.send('This is message from sender through UDP\n'.codeUnits, InternetAddress.loopbackIPv4, uniCastPort);

}