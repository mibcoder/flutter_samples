import 'package:flutter/material.dart';

import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Futures in Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'How to use Futures in Flutter'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({required this.title, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<String>(
        future: createFutureMethodOne(),
        builder: (context, snapshot) {
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

  Future<String> createFutureMethodOne() {
    Future<String> future = Future(() {
      Random rng = Random();
      if (rng.nextBool()) {
        return 'Success';
      } else {
        throw ("There is some error");
      }
    });
    return future;
  }
}