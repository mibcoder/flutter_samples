//Async Generators on Dart
main() {

  //Note: Generator's code will not run by calling step#1, it will run by using step#2

  //step#1 call AsyncGenerator
  Stream<int> asyncGenerator=createAsyncGenerator(15);

  //step#2 use AsyncGenerator
  asyncGenerator.listen((int value) {
    print('Value Form Async Generator: $value');
  });

}

//Create AsyncGenerator(this code will only run at step#2)
Stream<int> createAsyncGenerator(int n) async* {
  int k = 0;
  while (k < n) {
    //yield will not end the function on return value
    yield k++;
  }
}