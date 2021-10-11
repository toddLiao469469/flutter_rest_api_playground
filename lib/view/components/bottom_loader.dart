import 'package:flutter/material.dart';
import 'package:flutter_rest_api_playground/bloc/post_bloc.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({
    Key? key,
    required this.postStatus,
    required this.hasReachedMax,
  }) : super(key: key);
  final PostStatus postStatus;
  final bool hasReachedMax;
  @override
  Widget build(BuildContext context) {
    print('$hasReachedMax , $postStatus');
    return Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: hasReachedMax == true && postStatus == PostStatus.success
            ? const Text('that all')
            : const CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}
