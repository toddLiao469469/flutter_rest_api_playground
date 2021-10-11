import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_api_playground/simple_bloc_observer.dart';
import 'package:flutter_rest_api_playground/view/posts_page.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

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
      home: PostsPage(),
    );
  }
}
