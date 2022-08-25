void main(){
  useFutureMethodOne();
  useFutureMethodTwo();
}

//Use Future by then/catchError/whenComplete
void useFutureMethodOne(){

  Future<String> future =getFuture();

  future.then((String onValue){
    print('On success : $onValue');
  })
      .catchError((Object onError){
    print('On error : $onError');
  })
      .whenComplete((){
    print('On success/error its commpeted');
  });
}

//Use Future by async/await/try,catch,finally
void useFutureMethodTwo()async{

  Future<String> future =getFuture();

  try{
    String onValue=await future;
    print('On success : $onValue');
  }on Exception catch( onError){
    print('On error : $onError');
  }finally{
    print('On success/error its commpeted');
  }

}

Future<String> getFuture()=>Future.value('hi from future');