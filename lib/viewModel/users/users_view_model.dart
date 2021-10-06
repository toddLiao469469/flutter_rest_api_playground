import 'dart:convert';

import 'package:flutter_rest_api_playground/model/users/users.dart';
import 'package:flutter_rest_api_playground/service/http.dart';
import 'package:mobx/mobx.dart';
part 'users_view_model.g.dart';

class UsersViewModel = _UsersViewModelBase with _$UsersViewModel;

abstract class _UsersViewModelBase with Store {
  @observable
  ObservableFuture<ObservableList<Users>>? userList;

  @action
  Future fetchUserList() async {
    HttpService httpService = HttpService();
    final response = await httpService.get('users');
    final jsonStr = json.encode(response.data);
    final ObservableList<Users> result =
        ObservableList.of(usersFromJson(jsonStr));
    userList = ObservableFuture.value(result);
  }
}
