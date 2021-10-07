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

  final _$seletedUseridAtom = Atom(name: '_UsersViewModelBase.seletedUserid');

  @override
  String? get seletedUserid {
    _$seletedUseridAtom.reportRead();
    return super.seletedUserid;
  }

  @override
  set seletedUserid(String? value) {
    _$seletedUseridAtom.reportWrite(value, super.seletedUserid, () {
      super.seletedUserid = value;
    });
  }

  final _$seletedUserAtom = Atom(name: '_UsersViewModelBase.seletedUser');

  @override
  ObservableFuture<Users>? get seletedUser {
    _$seletedUserAtom.reportRead();
    return super.seletedUser;
  }

  @override
  set seletedUser(ObservableFuture<Users>? value) {
    _$seletedUserAtom.reportWrite(value, super.seletedUser, () {
      super.seletedUser = value;
    });
  }

  final _$loadingAtom = Atom(name: '_UsersViewModelBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$fooAtom = Atom(name: '_UsersViewModelBase.foo');

  @override
  ObservableFuture<String>? get foo {
    _$fooAtom.reportRead();
    return super.foo;
  }

  @override
  set foo(ObservableFuture<String>? value) {
    _$fooAtom.reportWrite(value, super.foo, () {
      super.foo = value;
    });
  }

  final _$fetchSeledtedUserAsyncAction =
      AsyncAction('_UsersViewModelBase.fetchSeledtedUser');

  @override
  Future<dynamic> fetchSeledtedUser(String? userid) {
    return _$fetchSeledtedUserAsyncAction
        .run(() => super.fetchSeledtedUser(userid));
  }

  final _$_UsersViewModelBaseActionController =
      ActionController(name: '_UsersViewModelBase');

  @override
  Future<dynamic> fetchFoo() {
    final _$actionInfo = _$_UsersViewModelBaseActionController.startAction(
        name: '_UsersViewModelBase.fetchFoo');
    try {
      return super.fetchFoo();
    } finally {
      _$_UsersViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchUserList() {
    final _$actionInfo = _$_UsersViewModelBaseActionController.startAction(
        name: '_UsersViewModelBase.fetchUserList');
    try {
      return super.fetchUserList();
    } finally {
      _$_UsersViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void seletedUsesrid(String? userid) {
    final _$actionInfo = _$_UsersViewModelBaseActionController.startAction(
        name: '_UsersViewModelBase.seletedUsesrid');
    try {
      return super.seletedUsesrid(userid);
    } finally {
      _$_UsersViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userList: ${userList},
seletedUserid: ${seletedUserid},
seletedUser: ${seletedUser},
loading: ${loading},
foo: ${foo}
    ''';
  }
}
