import 'dart:async';
import 'dart:math';

void main() {

  Future<int> future;

  //Create Future by Future class constructor
  //future=createFutureMethodOne();

  //Create future by Completer
  //future=createFutureMethodTwo();

  //Create future by marking method "async"
  //future=createFutureMethodThree();

  //Create future class factory constructors(Its mostly helpful in unit tests)
  future=createFutureMethodFour();

  //*********************One way to use Future*********************
  future.then((int value){
    print('future result :$value');

  });
  future.catchError((Object error){
    print('future error : $error');
  });

  future.whenComplete((){
    print('future is completed');
  });
  //*****************End One way to use Future*********************
}

//Create Future by Future class constructor
Future<int> createFutureMethodOne() {
  Future<int> future = Future(workDoInFuture);
  return future;
}
int workDoInFuture(){

  //Do any work here it can be Async/Isolate
  print('workDoInFuture');

  Random rng =  Random();
  if(rng.nextBool()){
    return rng.nextInt(100);
  }else{
    throw("There is some error");
  }

}

//Create future by Completer
Future<dynamic> createFutureMethodTwo(){
  Completer completer = Completer<int>();

  //Do any work here it can be Async/Isolate
  Random rng =  Random();
  if(rng.nextBool()){
    completer.complete(rng.nextInt(100));
  }else{
    completer.completeError("There is some error");

    throw("There is some error");
  }

  return completer.future;
}

//Create future by marking method "async"
Future<int> createFutureMethodThree() async {

  //Do any work here it can be Async/Isolate
  Random rng =  Random();
  if(rng.nextBool()){
    return rng.nextInt(100);
  }else{
    throw("There is some error");
  }
}

//Create future class factory constructors(Its mostly helpful in unit tests)
Future<int> createFutureMethodFour(){

  Random rng =  Random();
  if(rng.nextBool()){
    int value= rng.nextInt(100);

    //First e.g.
//    return Future.value(value);

    //Second e.g.
//    return Future.error('There is some error');

    //Third e.g.
    return Future.delayed( Duration(seconds: 3),(){
      return value;
    });

  }else{
    throw("There is some error");
  }
}