import 'package:flutter_rest_api_playground/model/users/users.dart';
import 'package:flutter_rest_api_playground/service/http.dart';
import 'package:mobx/mobx.dart';
part 'user_detail_view_model.g.dart';

class UserDetailViewModel = _UserDetailViewModelBase with _$UserDetailViewModel;

abstract class _UserDetailViewModelBase with Store {
  final HttpService _httpService = HttpService();

  @observable
  String? seletedUserid = '1';

  @observable
  ObservableFuture<Users>? seletedUser;

  @observable
  bool loading = true;

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
