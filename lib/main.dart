import 'dart:convert';

import 'package:flutter/material.dart';
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
  Future<List<Users>> fetchData() async {
    HttpService httpService = HttpService();
    final response = await httpService.get('users');
    final jsonStr = json.encode(response.data);
    final result = usersFromJson(jsonStr);
    print(result[0]);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<List<Users>>(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('loading...');
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Text('${snapshot.data![0].name}');
                    }
                  }
                  if (snapshot.hasError) {
                    return const Text('error!!');
                  }

                  return const Text('loading...');
                })
          ],
        ),
      ),
    );
  }
}
