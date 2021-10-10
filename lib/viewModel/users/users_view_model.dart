import 'dart:convert';

import 'package:flutter_rest_api_playground/model/users/users.dart';
import 'package:flutter_rest_api_playground/service/http.dart';
import 'package:mobx/mobx.dart';
part 'users_view_model.g.dart';

class UsersViewModel = _UsersViewModelBase with _$UsersViewModel;

enum StoreStatus { initial, loading, done }

abstract class _UsersViewModelBase with Store {
  final HttpService _httpService = HttpService();

  @observable
  ObservableList<Users>? userList;

  @observable
  ObservableFuture<ObservableList<Users>>? _userListFuture;

  @observable
  ObservableFuture<String>? foo;

  @computed
  StoreStatus get status {
    if (_userListFuture == null ||
        _userListFuture?.status == FutureStatus.rejected) {
      return StoreStatus.initial;
    }
    return _userListFuture!.status == FutureStatus.pending
        ? StoreStatus.loading
        : StoreStatus.done;
  }

  @action
  Future fetchFoo() {
    return foo = ObservableFuture(Future.delayed(
      const Duration(seconds: 3),
      () => 'foo',
    ));
  }

  @action
  Future fetchUserList() async {
    _userListFuture = ObservableFuture(Future(() async {
      final response = await _httpService.get('users');
      final jsonStr = json.encode(response.data);
      final ObservableList<Users> result =
          ObservableList.of(usersFromJson(jsonStr));
      return result;
    }));
    userList = await _userListFuture;
  }
}
