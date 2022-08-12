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
  //This is Callback function you can give any name
  final Function(bool, String) myCallBack;

  WorkerWithConstructorCallBack({required this.myCallBack}){
    //You can respond back within constructor
    myCallBack(true, "This is initial data from constructor callback");
  }

  void doWork() {
    //This way, You can respond back from different methods
    myCallBack(true, "This is processed data from constructor callback");
  }
}

//Callback through setter in dart
class WorkerWithSetterCallBack {
  //This is Callback function you can give any name,
  //We make it optional as we are not Passing value though constructor
  Function(bool, String)? myCallBack;

  //This is setter to assign callback function to use here or to use latter
  void setMyListener({required Function(bool, String) callBack}) {
    myCallBack = callBack;
  }

  void doWork() {
    //This way, You can respond back from different methods
    //First check callback should not be null
    if (myCallBack != null) {
      myCallBack!(true, "This is processed data from setter callback");
    }
  }
}

//Callback directly through function in dart
class WorkerWithFunctionCallBack {

  //Pass callback as parameter of another function
  void doWork({required Function(bool, String) callBack}) {
    //Send back response when required
    callBack(true, "This is processed data from function callback");
  }
}
