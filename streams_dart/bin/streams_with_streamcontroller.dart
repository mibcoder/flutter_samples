import 'dart:async';

void main(List<String> arguments) {
  Stream<int> streamFromStreamController = createStreamUsingStreamController(const Duration(seconds: 1), 15);

  streamFromStreamController.listen((int value) {
    print('Value Form StreamController: $value');
  });
}

/*
To create Streams in dart"
step#1 create StreamController object
step#2 to emit value on stream use "add" method of StreamController object
 */
Stream<int> createStreamUsingStreamController(Duration interval, int maxCount) {

  StreamController<int>? controller;
  Timer? timer;
  int counter = 0;

  void tick(_) {

    counter++;
    //Step#2
    controller?.add(counter); // Ask stream to send counter values as event.
    if (counter == maxCount) {
      timer?.cancel();
      controller?.close(); // Ask stream to shut down and tell listeners.
    }

  }

  void startTimer() {
    print('createStreamUsingStreamController start');

    timer = Timer.periodic(interval, tick);
  }

  void stopTimer() {
    if (timer != null) {
      timer?.cancel();
      timer = null;
    }
    print('createStreamUsingStreamController end');

  }

  //Step#1
  controller = StreamController<int>(
      onListen: startTimer,
      onPause: stopTimer,
      onResume: startTimer,
      onCancel: stopTimer);

  return controller.stream;
}