import 'dart:developer';//To get IsolateID
import 'dart:isolate';//To get current Isolate

void main(List<String> arguments) async{

  print("Main task started: ${DateTime.now().second} = ${Service.getIsolateID(Isolate.current)}");

  print("Add To Queue ----- Long task at : ${DateTime.now().second} = ${Service.getIsolateID(Isolate.current)}");
  longTask("message");

  print("Add To Queue ----- Small task at : ${DateTime.now().second} = ${Service.getIsolateID(Isolate.current)}");
  smallTask("message");

  var timeNow = DateTime.now();
  var timeEnd = DateTime.now().add(Duration(seconds: 10));
  while(timeEnd.millisecondsSinceEpoch > timeNow.millisecondsSinceEpoch){
    timeNow = DateTime.now();
  }
  print("Main task ended : ${DateTime.now().second} = ${Service.getIsolateID(Isolate.current)} \n\n");

  Future((){
    print("Another task : ${DateTime.now().second} = ${Service.getIsolateID(Isolate.current)} \n\n");
  });

}

longTask(String pram) async{

  await Future.delayed(Duration(seconds: 0),(){
    print("Long task stated: ${DateTime.now().second} = ${Service.getIsolateID(Isolate.current)}");

    var timeNow = DateTime.now();
    var timeEnd = DateTime.now().add(Duration(seconds: 5));
    while(timeEnd.millisecondsSinceEpoch > timeNow.millisecondsSinceEpoch){
      timeNow = DateTime.now();
    }

    print("Long task ended: ${DateTime.now().second} = ${Service.getIsolateID(Isolate.current)} \n\n");
  });

}

smallTask(String pram) async{

  await Future.delayed(Duration(seconds: 0),(){
    print("Small task started and ended: ${DateTime.now().second} = ${Service.getIsolateID(Isolate.current)}\n\n");
  });

}
