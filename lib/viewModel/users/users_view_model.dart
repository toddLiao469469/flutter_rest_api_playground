import 'dart:convert';

import 'package:flutter_rest_api_playground/model/users/users.dart';
import 'package:flutter_rest_api_playground/service/http.dart';
import 'package:mobx/mobx.dart';
part 'users_view_model.g.dart';

class UsersViewModel = _UsersViewModelBase with _$UsersViewModel;

abstract class _UsersViewModelBase with Store {
  final HttpService _httpService = HttpService();

  @observable
  ObservableFuture<ObservableList<Users>>? userList;

  @observable
  String? seletedUserid = '1';

  @observable
  ObservableFuture<Users>? seletedUser;

  @observable
  bool loading = true;

  @observable
  ObservableFuture<String>? foo;

  @action
  Future fetchFoo() {
    return foo = ObservableFuture(Future.delayed(
      const Duration(seconds: 3),
      () => 'foo',
    ));
  }

  @action
  Future fetchUserList() {
    return userList = ObservableFuture(Future(() async {
      final response = await _httpService.get('users');
      final jsonStr = json.encode(response.data);
      final ObservableList<Users> result =
          ObservableList.of(usersFromJson(jsonStr));
      return userList = ObservableFuture.value(result);
    }));
  }

  @action
  void seletedUsesrid(String? userid) {
    seletedUserid = userid;
  }

  @action
  Future fetchSeledtedUser(String? userid) async {
    runInAction(() {
      loading = true;
    });
    final response = await _httpService.get('users/$userid');

    final Users result = Users.fromJson(response.data);
    runInAction(() {
      seletedUser = ObservableFuture.value(result);
      loading = false;
    });
  }

  late List<ReactionDisposer> _disposers;
  void setupReactions() {
    _disposers = [
      reaction<String?>((_) => seletedUserid, fetchSeledtedUser),
    ];
  }

  void dispose() {
    for (var d in _disposers) {
      d();
    }
  }
}
