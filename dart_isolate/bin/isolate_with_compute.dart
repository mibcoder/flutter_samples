
import 'dart:developer';
import 'dart:io';
import 'dart:isolate';

import 'package:compute/compute.dart';


void main() async{

  /*
  As compute function is of Flutter to use in dart i need include a package named "compute"
   */

  /*
  Create new Isolate, just after creating new Isolate control of this main Isolate,
  start executing next instructions below the new Isolate creation line,
  where as new Isolate keep working in parallel of main/other Isolates
   */

  print('Going to create new Isolate');
  String response = await compute(runSomethingOnNewIsolate, 'first long task');
  print('Here is response from new isolate: $response');

  print('Main IsolateId:${Service.getIsolateID(Isolate.current)}');

  /*
  After executing all the instructions of main method app will killed,
  so to pause the main method(using stdin.first), so that we can wait in case
  "new Isolate" not finish yet.
  Press Enter to move forward
   */
  await stdin.first;

}

Future<String> runSomethingOnNewIsolate(String arg) async{

  print('New IsolateId:${Service.getIsolateID(Isolate.current)} Created With arg : $arg');

  //Do long running task here
  await Future.delayed(Duration(seconds: 2));
  print('New IsolateId:${Service.getIsolateID(Isolate.current)} ended');
  //End long running task
  return "this is message from new isolate";
}
