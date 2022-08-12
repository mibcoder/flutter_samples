void main(List<String> arguments) {

  //Callback through constructor in dart
  WorkerWithConstructorCallBack workerWithConstructorCallBack =
      WorkerWithConstructorCallBack(myCallBack: (bool status, String data) {
    print("\n\nCallback function status: $status and data: $data \n\n");
  });
  workerWithConstructorCallBack.doWork();

  //Callback through setter in dart
  WorkerWithSetterCallBack workerWithSetterCallBack =
      WorkerWithSetterCallBack();
  workerWithSetterCallBack.setMyListener(callBack: (bool status, String data) {
    print("Callback function status: $status and data: $data \n\n");
  });
  workerWithSetterCallBack.doWork();

  //Callback directly through function in dart
  WorkerWithFunctionCallBack workerWithFunctionCallBack =
      WorkerWithFunctionCallBack();
  workerWithFunctionCallBack.doWork(callBack: (bool status, String data) {
    print("Callback function status: $status and data: $data \n\n");
  });
}

//Callback through constructor in dart
class WorkerWithConstructorCallBack {
  final Function(bool, String) myCallBack;

  WorkerWithConstructorCallBack({required this.myCallBack});

  void doWork() {
    myCallBack(true, "This is processed data from constructor callback");
  }
}

//Callback through setter in dart
class WorkerWithSetterCallBack {
  Function(bool, String)? myCallBack;

  void setMyListener({required Function(bool, String) callBack}) {
    myCallBack = callBack;
  }

  void doWork() {
    if (myCallBack != null) {
      myCallBack!(true, "This is processed data from setter callback");
    }
  }
}

//Callback directly through function in dart
class WorkerWithFunctionCallBack {
  void doWork({required Function(bool, String) callBack}) {
    callBack(true, "This is processed data from function callback");
  }
}
