import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rest_api_playground/service/injector_provider.dart';
import 'package:flutter_rest_api_playground/model/users/users.dart';
import 'package:flutter_rest_api_playground/view/users/users_card.dart';
import 'package:flutter_rest_api_playground/viewModel/users/users_view_model.dart';
import 'package:mobx/mobx.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({Key? key}) : super(key: key);

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  final usersViewModel = inject<UsersViewModel>();

  @override
  void initState() {
    usersViewModel.fetchUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users List Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Observer(builder: (_) {
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

                return Container(
                  width: 300,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      ...items.map((userInfo) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UserCard(userInfo: userInfo),
                          ))
                    ],
                  ),
                );
            }

            return const Text('loading');
          }),
        ),
      ),
    );
  }
}
