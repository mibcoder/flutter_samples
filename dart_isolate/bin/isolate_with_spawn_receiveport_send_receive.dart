import 'dart:developer';
import 'dart:isolate';

void main() async{

  ReceivePort receivePort= ReceivePort();

  /*
  Create new Isolate, just after creating new Isolate control of this main Isolate,
  start executing next instructions below the new Isolate creation line,
  where as new Isolate keep working in parallel of main/other Isolates
   */
  print('Going to create new Isolate');
  Isolate isolate=await Isolate.spawn(runSomethingOnNewIsolate, receivePort.sendPort);
  print('New Isolate Created and it started his work');


  for(int progress=0;progress<500;progress++){
    print('Main IsolateId:${Service.getIsolateID(Isolate.current)} progress : $progress');
  }

  //To receive messages from new Isolate
  receivePort.listen((dynamic receivedData) {

    if (receivedData is SendPort) {
      SendPort sendPortOfNewIsolate = receivedData;
      for(int command=0;command<500;command++){
        print('old Isolate command : $command');
        sendPortOfNewIsolate.send(command);
      }
      //kill the new isolate no longer is needed
      isolate.kill(priority: Isolate.immediate);

    }else{
      print('Data from new isolate, command : $receivedData');

    }
  });

}

void runSomethingOnNewIsolate(SendPort sendPortOfOldIsolate) {

  ReceivePort receivePort=ReceivePort();

  print('New IsolateId:${Service.getIsolateID(Isolate.current)} Created With arg data : ${sendPortOfOldIsolate}');
  //listen to messages send by old isolate
  receivePort.listen((dynamic receivedData) {
    print('New IsolateId:${Service.getIsolateID(Isolate.current)} progress command : $receivedData');
    sendPortOfOldIsolate.send(receivedData);
  });

  //sendPort send to old isolate, so it can send message to this isolate
  sendPortOfOldIsolate.send(receivePort.sendPort);
}