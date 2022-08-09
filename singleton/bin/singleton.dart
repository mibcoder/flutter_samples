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
  EarlyInstantiationSingleton._privateConstructor();

  static final EarlyInstantiationSingleton _instance =
      EarlyInstantiationSingleton._privateConstructor();

  factory EarlyInstantiationSingleton() {
    return _instance;
  }

  void doSomething() {
    print('doSomething in Early Instantiation Singleton');
  }
}

//Lazy Instantiation
class LazyInstantiationSingleton {
  LazyInstantiationSingleton._privateConstructor();

  static LazyInstantiationSingleton? _instance;

  static LazyInstantiationSingleton get instance {
    return _instance ??= LazyInstantiationSingleton._privateConstructor();
  }

  void doSomething() {
    print('doSomething in Lazy Instantiation Singleton');
  }
}
