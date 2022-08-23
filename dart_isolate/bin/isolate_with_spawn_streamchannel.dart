import 'dart:developer';
import 'dart:isolate';
import 'package:stream_channel/isolate_channel.dart';

//Bidirectional communication with isolates in Dart 2
void main() async {

  ReceivePort rPort =  ReceivePort();
  IsolateChannel channel = IsolateChannel.connectReceive(rPort);

  print('Main IsolateId:${Service.getIsolateID(Isolate.current)}');

  channel.stream.listen((data) {
    print('rootIsolate received : $data');
    channel.sink.add('How are you');
  });

  await Isolate.spawn(elIsolate, rPort.sendPort);

}

void elIsolate(SendPort sPort) {
  print("New IsolateId:${Service.getIsolateID(Isolate.current)} created");

  IsolateChannel channel = IsolateChannel.connectSend(sPort);
  channel.stream.listen((data) {
    print('New IsolateId:${Service.getIsolateID(Isolate.current)} received : $data');
  });
  channel.sink.add("hi");
}