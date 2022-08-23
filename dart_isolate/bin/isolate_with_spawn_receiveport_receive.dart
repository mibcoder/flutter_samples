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
    print('Data from new isolate : $receivedData');

    //Kill new isolate on a condition
    if(receivedData is String && receivedData.toString().contains('task completed')){
      //Kill new Isolate
      isolate.kill(priority: Isolate.immediate);
    }
  });

}

void runSomethingOnNewIsolate(SendPort sendPort) {

  print('New IsolateId:${Service.getIsolateID(Isolate.current)} Created With arg data : ${sendPort}');
  //Do long running task here
  for(int progress=0; progress<500 ;progress++){

    print('New IsolateId:${Service.getIsolateID(Isolate.current)} progress : $progress');
    sendPort.send(progress);
  }
  sendPort.send("task completed");
  print('New IsolateId:${Service.getIsolateID(Isolate.current)} completed');
  //End long running task
}