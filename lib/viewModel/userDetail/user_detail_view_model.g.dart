// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserDetailViewModel on _UserDetailViewModelBase, Store {
  final _$seletedUseridAtom =
      Atom(name: '_UserDetailViewModelBase.seletedUserid');

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

  final _$seletedUserAtom = Atom(name: '_UserDetailViewModelBase.seletedUser');

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

  final _$loadingAtom = Atom(name: '_UserDetailViewModelBase.loading');

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

  final _$fetchSeledtedUserAsyncAction =
      AsyncAction('_UserDetailViewModelBase.fetchSeledtedUser');

  @override
  Future<dynamic> fetchSeledtedUser(String? userid) {
    return _$fetchSeledtedUserAsyncAction
        .run(() => super.fetchSeledtedUser(userid));
  }

  final _$_UserDetailViewModelBaseActionController =
      ActionController(name: '_UserDetailViewModelBase');

  @override
  void seletedUsesrid(String? userid) {
    final _$actionInfo = _$_UserDetailViewModelBaseActionController.startAction(
        name: '_UserDetailViewModelBase.seletedUsesrid');
    try {
      return super.seletedUsesrid(userid);
    } finally {
      _$_UserDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
seletedUserid: ${seletedUserid},
seletedUser: ${seletedUser},
loading: ${loading}
    ''';
  }
}
