import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rest_api_playground/viewModel/users/users_view_model.dart';
import 'package:mobx/mobx.dart';

import 'model/users/users.dart';
import 'view/components/custom_dropdown_button.dart';

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
    usersViewModel.fetchFoo();
    super.initState();
    usersViewModel.setupReactions();
  }

  @override
  void dispose() {
    usersViewModel.dispose();
    super.dispose();
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
            Observer(builder: (_) {
              final future = usersViewModel.foo;
              if (future == null) {
                return const Text('null');
              }
              switch (future.status) {
                case FutureStatus.pending:
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      Text('loading'),
                    ],
                  );
                case FutureStatus.fulfilled:
                  final String items = future.result;

                  return Text(items);
              }

              return const Text('loading');
            }),
            Observer(builder: (_) {
              final future = usersViewModel.userList;
              if (future == null) {
                return const Text('null');
              }
              switch (future.status) {
                case FutureStatus.pending:
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      Text('loading'),
                    ],
                  );
                case FutureStatus.fulfilled:
                  final ObservableList<Users> items = future.result;

                  return Column(
                    children: [
                      const Text('all user name'),
                      Wrap(
                        children: [
                          ...items.map(
                            (element) => Text('${element.name!} ,'),
                          ),
                        ],
                      )
                    ],
                  );
              }

              return const Text('loading');
            }),
            CustomDropdownButton(
              usersViewModel: usersViewModel,
            ),
            Observer(
              builder: (_) {
                final future = usersViewModel.seletedUser;
                if (future == null) {
                  return const Text('null');
                }

                switch (usersViewModel.loading) {
                  case true:
                    return const CircularProgressIndicator();

                  case false:
                    final Users items = future.result;

                    return Column(
                      children: [
                        Text(items.name!),
                      ],
                    );
                }
                return Text('null');
              },
            ),
          ],
        ),
      ),
    );
  }
}
