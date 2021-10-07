import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_api_playground/model/users/users.dart';
import 'package:flutter_rest_api_playground/routes/router.gr.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.userInfo}) : super(key: key);
  final Users userInfo;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                userInfo.name!,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          Row(
            children: [const Text('username'), Text(userInfo.username!)],
          ),
          Row(
            children: [const Text('email'), Text(userInfo.email!)],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).pushNamed('/user/${userInfo.id}');
                },
                child: Text('datailPage'),
              )
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
    );
  }
}
