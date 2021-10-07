import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rest_api_playground/viewModel/users/users_view_model.dart';
import 'package:mobx/mobx.dart';

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
  UsersViewModel usersViewModel = UsersViewModel();

  @override
  void initState() {
    usersViewModel.fetchUserList();
    super.initState();
  }

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
            Observer(
              builder: (_) {
                final future = usersViewModel.userList;
                if (future == null) {
                  return const Text('loading');
                }
                if (future.status == FutureStatus.pending) {
                  return const Text('loading');
                }
                if (future.status == FutureStatus.fulfilled) {
                  final ObservableList<Users> items = future.result;

                  return Text(items[0].name!);
                }
                return const Text('loading');
              },
            ),
          ],
        ),
      ),
    );
  }
}
