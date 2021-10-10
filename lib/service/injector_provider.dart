import 'package:flutter_rest_api_playground/viewModel/userDetail/user_detail_view_model.dart';
import 'package:flutter_rest_api_playground/viewModel/users/users_view_model.dart';
import 'package:get_it/get_it.dart';

final GetIt inject = GetIt.I;

Future<void> setupInjection() async {
  //ViewModels
  inject.registerLazySingleton<UsersViewModel>(() => UsersViewModel());
  inject
      .registerLazySingleton<UserDetailViewModel>(() => UserDetailViewModel());
}
