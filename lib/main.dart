import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rest_api_playground/bloc/counter_bloc.dart';
import 'package:flutter_rest_api_playground/service/http.dart';

import 'model/users/users.dart';

void main() {
  runApp(const MyApp());
}

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bloc = CounterBLoC();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () {
                      bloc.counterEventSink.add(DecrementEvent());
                    },
                    child: Text('-1')),
                OutlinedButton(
                    onPressed: () {
                      bloc.counterEventSink.add(IncrementEvent());
                    },
                    child: Text('+1')),
              ],
            ),
            StreamBuilder(
                stream: bloc.streamCounter,
                initialData: 0,
                builder: (context, snapshot) {
                  return Center(child: Text(snapshot.data.toString()));
                })
          ],
        ),
      ),
    );
  }
}
