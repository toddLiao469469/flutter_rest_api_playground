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
      child: Expanded(
        child: hasReachedMax == true && postStatus == PostStatus.success
            ? const _TextSection()
            : const _CircularProgress(),
      ),
    );
  }
}

class _TextSection extends StatelessWidget {
  const _TextSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'no more posts to showpost',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class _CircularProgress extends StatelessWidget {
  const _CircularProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator(strokeWidth: 1.5),
    );
  }
}
