//Sync Generators on Dart
main() {

  //Note: Generator's code will not run by calling step#1, it will run by using step#2

  //step#1 call SyncGenerator
  Iterable<int> syncGenerator=createSyncGenerator(15);

  //step#2 use SyncGenerator
  Iterator<int> iterator=syncGenerator.iterator;
  while(iterator.moveNext()) {
    print(iterator.current);
  }


}

//Create SyncGenerator(this code will only run at step#2)
Iterable<int> createSyncGenerator(int n) sync* {
  int k = 0;
  while (k < n) {
    //yield will not end the function on return value
    yield k++;
  }
}