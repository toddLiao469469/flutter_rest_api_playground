import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_api_playground/service/injector_provider.dart';
import 'package:flutter_rest_api_playground/model/users/users.dart';
import 'package:flutter_rest_api_playground/routes/router.gr.dart';
import 'package:flutter_rest_api_playground/viewModel/userDetail/user_detail_view_model.dart';
import 'package:flutter_rest_api_playground/viewModel/users/users_view_model.dart';

class UserCard extends StatelessWidget {
  UserCard({Key? key, required this.userInfo}) : super(key: key);
  final Users userInfo;

  final usersViewModel = inject<UsersViewModel>();
  final userDetailViewModel = inject<UserDetailViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                userInfo.name!,
                style: const TextStyle(fontSize: 16),
              ),
              GestureDetector(
                onTap: () {
                  // AutoRouter.of(context).pushNamed('/user/${userInfo.id}');
                  userDetailViewModel.fetchSeledtedUser(userInfo.id.toString());
                  AutoRouter.of(context)
                      .push(UserDetailRoute(userId: userInfo.id.toString()));
                },
                child: const Icon(Icons.arrow_forward),
              )
            ],
          )
        ],
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(3.0, 6.0),
            blurRadius: 6,
            spreadRadius: 3,
          )
        ],
      ),
    );
  }
}
