// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsersViewModel on _UsersViewModelBase, Store {
  Computed<StoreStatus>? _$statusComputed;

  @override
  StoreStatus get status =>
      (_$statusComputed ??= Computed<StoreStatus>(() => super.status,
              name: '_UsersViewModelBase.status'))
          .value;

  final _$userListAtom = Atom(name: '_UsersViewModelBase.userList');

  @override
  ObservableList<Users>? get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(ObservableList<Users>? value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  final _$_userListFutureAtom =
      Atom(name: '_UsersViewModelBase._userListFuture');

  @override
  ObservableFuture<ObservableList<Users>>? get _userListFuture {
    _$_userListFutureAtom.reportRead();
    return super._userListFuture;
  }

  @override
  set _userListFuture(ObservableFuture<ObservableList<Users>>? value) {
    _$_userListFutureAtom.reportWrite(value, super._userListFuture, () {
      super._userListFuture = value;
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

  final _$fetchUserListAsyncAction =
      AsyncAction('_UsersViewModelBase.fetchUserList');

  @override
  Future<dynamic> fetchUserList() {
    return _$fetchUserListAsyncAction.run(() => super.fetchUserList());
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
  String toString() {
    return '''
userList: ${userList},
foo: ${foo},
status: ${status}
    ''';
  }
}
