import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rest_api_playground/service/injector_provider.dart';
import 'package:flutter_rest_api_playground/model/users/users.dart';
import 'package:flutter_rest_api_playground/viewModel/users/users_view_model.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({Key? key, @PathParam('id') required this.userId})
      : super(key: key);
  final String userId;
  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  final usersViewModel = inject<UsersViewModel>();

  // @override
  // void initState() {
  //   usersViewModel.fetchSeledtedUser(widget.userId);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          final future = usersViewModel.seletedUser;
          if (future == null) {
            return const Text('');
          }
          switch (usersViewModel.loading) {
            case false:
              return Text('${future.result?.name}');
          }
          return const Text('');
        }),
      ),
      body: Center(
        child: Column(
          children: [
            Text('${widget.userId}'),
            Observer(builder: (_) {
              final future = usersViewModel.seletedUser;
              if (future == null) {
                return const Text('null');
              }
              switch (usersViewModel.loading) {
                case true:
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      Text('loading'),
                    ],
                  );
                case false:
                  final Users item = future.result;

                  return Container(
                    width: 300,
                    alignment: Alignment.center,
                    child: Column(
                      children: [Text('${item.name}')],
                    ),
                  );
              }
              return Text('');
            }),
          ],
        ),
      ),
    );
  }
}
