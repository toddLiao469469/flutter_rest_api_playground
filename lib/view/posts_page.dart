import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rest_api_playground/bloc/post_bloc.dart';
import 'package:flutter_rest_api_playground/view/posts_list.dart';

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocProvider(
        create: (_) => PostBloc()..add(PostFetched()),
        child: PostsList(),
      ),
    );
  }
}
