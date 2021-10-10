import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_api_playground/service/inherited_widget.dart';
import 'package:flutter_rest_api_playground/service/injector_provider.dart';
import 'package:flutter_rest_api_playground/viewModel/userDetail/user_detail_view_model.dart';
import 'package:flutter_rest_api_playground/viewModel/users/users_view_model.dart';

import 'routes/router.gr.dart';

void main() {
  setupInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: AutoRouterDelegate(_appRouter),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );

    // return MaterialApp(
    //   routes: {
    //     '/': (context) => const MyHomePage(),
    //     'users_list': (context) => const UsersListPage(),
    //   },
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UsersViewModel usersViewModel = UsersViewModel();
  UserDetailViewModel userDetailViewModel = UserDetailViewModel();
  int count = 0;

  @override
  void initState() {
    usersViewModel.fetchUserList();
    usersViewModel.fetchFoo();
    super.initState();
    userDetailViewModel.setupReactions();
  }

  @override
  void dispose() {
    userDetailViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: const Text('listPage'),
              onTap: () {
                AutoRouter.of(context).push(const UsersListRoute());
                // Navigator.pushNamed(context, 'users_list');
              },
            ),
            DataWidget(
              data: count,
              child: Column(
                children: [
                  _Foo(),
                  GestureDetector(
                    child: const Text('add 1'),
                    onTap: () {
                      setState(() {
                        count++;
                      });
                      // Navigator.pushNamed(context, 'users_list');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Foo extends StatefulWidget {
  _Foo({Key? key}) : super(key: key);

  @override
  __FooState createState() => __FooState();
}

class __FooState extends State<_Foo> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Dependencies change");
  }

  @override
  Widget build(BuildContext context) {
    return Text(DataWidget.of(context)!.data.toString());
  }
}
