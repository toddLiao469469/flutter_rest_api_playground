import 'package:flutter/material.dart';

class DataWidget extends InheritedWidget {
  const DataWidget({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(child: child, key: key);
  final int data;
  static DataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataWidget>();
  }

  @override
  bool updateShouldNotify(DataWidget old) {
    return old.data != data;
  }
}
