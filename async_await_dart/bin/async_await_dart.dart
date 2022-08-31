void main(){
  useFutureMethod();
}

//Use Future by async/await/try,catch,finally
void useFutureMethod()async{

  Future<String> future =getFuture();

  try{
    String onValue=await future;
    print('On success : $onValue');
  } catch( onError){
    print('On error : $onError');
  }finally{
    print('On success/error its competed\n');
  }

  Future<String> futureWithError =getFutureWithError();
  try{
    String onValue=await futureWithError;
    print('On success : $onValue');
  } catch( onError){
    print('On error : $onError');
  }finally{
    print('On success/error its competed');
  }

}

Future<String> getFuture()=>Future.value('hi from future');
Future<String> getFutureWithError()=>Future.error('This is test error message');
