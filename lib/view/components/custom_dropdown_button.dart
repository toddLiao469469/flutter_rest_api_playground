import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rest_api_playground/viewModel/users/users_view_model.dart';

class CustomDropdownButton extends StatelessWidget {
  CustomDropdownButton({Key? key, required this.usersViewModel})
      : super(key: key);
  final UsersViewModel usersViewModel;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return DropdownButton<String>(
        value: usersViewModel.seletedUserid,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? newValue) {
          usersViewModel.seletedUsesrid(newValue);
        },
        items: List.generate(10, (index) => (index + 1).toString())
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });
  }
}
