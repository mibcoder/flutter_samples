void main(List<String> arguments) {
  //To call stream
  Stream<int> streamFromAsyncGenerator = createStreamUsingAsyncGenerator(const Duration(seconds: 1), 15);

  //Listen to a stream
  streamFromAsyncGenerator.listen((int value) {
    print('Value Form Async Generator: $value');
  });
}

/*
To create Streams in dart"
step#1 add "async*" to function definition
step#2 to emit value on stream use "yield"
 */
Stream<int> createStreamUsingAsyncGenerator(Duration interval,int maxCount) async* { //Step#1
  print('createStreamUsingAsyncGenerator start');

  int counter = 0;
  while (true) {

    await Future.delayed(interval);
    counter++;

    //Step#2 To emit value on stream
    yield counter;

    if (counter == maxCount) break;
  }

  print('createStreamUsingAsyncGenerator end');

}