// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsersViewModel on _UsersViewModelBase, Store {
  final _$userListAtom = Atom(name: '_UsersViewModelBase.userList');

  @override
  ObservableFuture<ObservableList<Users>>? get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(ObservableFuture<ObservableList<Users>>? value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  final _$fetchUserListAsyncAction =
      AsyncAction('_UsersViewModelBase.fetchUserList');

  @override
  Future<dynamic> fetchUserList() {
    return _$fetchUserListAsyncAction.run(() => super.fetchUserList());
  }

  @override
  String toString() {
    return '''
userList: ${userList}
    ''';
  }
}
