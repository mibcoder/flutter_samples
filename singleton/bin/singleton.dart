main() {

  //To use Early Instantiation
  EarlyInstantiationSingleton earlyInstantiationSingleton =
      EarlyInstantiationSingleton();
  earlyInstantiationSingleton.doSomething();

  //To use Lazy Instantiation
  LazyInstantiationSingleton lazyInstantiationSingleton =
      LazyInstantiationSingleton.instance;
  lazyInstantiationSingleton.doSomething();
}

//Early Instantiation
class EarlyInstantiationSingleton {

  //Step#1 Create private constructor
  EarlyInstantiationSingleton._privateConstructor();

  //Step#2 create private static variable to store instance of this class
  static final EarlyInstantiationSingleton _instance =
      EarlyInstantiationSingleton._privateConstructor();

  //Step#3 return instance of this class through factory constructor
  factory EarlyInstantiationSingleton() {
    return _instance;
  }

  void doSomething() {
    print('doSomething in Early Instantiation Singleton');
  }
}

//Lazy Instantiation
class LazyInstantiationSingleton {

  //Step#1 Create private constructor
  LazyInstantiationSingleton._privateConstructor();

  //Step#2 create private static variable to store instance of this class
  static LazyInstantiationSingleton? _instance;

  //Step#3 return instance of this class through getter
  static LazyInstantiationSingleton get instance {
    return _instance ??= LazyInstantiationSingleton._privateConstructor();
  }

  void doSomething() {
    print('doSomething in Lazy Instantiation Singleton');
  }
}
