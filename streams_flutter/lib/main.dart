import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key,required this.title}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      body: StreamBuilder<int>(
        stream: createStreamUsingAsyncGenerator(const Duration(seconds: 1), 15),
        builder: (context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasError) {
            // Future completed with an error.
            return Text(
              'On error : ${snapshot.error}',
            );
          } else if (snapshot.hasData) {
            // Future completed with a value.
            return Text(
              'On success : ${snapshot.data}',
            );
          } else {
            // Uncompleted.
            return const Text(
              'Waiting',
            );
          }
        },
      ),
    );
  }

  Stream<int> createStreamUsingAsyncGenerator(Duration interval, int maxCount) async* {
    if (kDebugMode) {
      print('createStreamUsingAsyncGenerator start');
    }

    int counter = 0;
    while (true) {
      await Future.delayed(interval);
      counter++;
      yield counter;
      if (counter == maxCount) break;
    }

    if (kDebugMode) {
      print('createStreamUsingAsyncGenerator end');
    }

  }

}