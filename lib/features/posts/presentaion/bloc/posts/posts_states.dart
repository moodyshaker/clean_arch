import 'package:equatable/equatable.dart';

import '../../../domain/entities/post.dart';

abstract class PostStates extends Equatable {
  @override
  List<Object> get props => [];
}

class InitPostsState extends PostStates {}

class LoadingPostsState extends PostStates {}

class LoadedPostsState extends PostStates {
  final List<Post> posts;

  LoadedPostsState({required this.posts});

  @override
  List<Object> get props => [posts];
}

class ErrorPostsState extends PostStates {
  final String message;

  ErrorPostsState({required this.message});

  @override
  List<Object> get props => [message];
}
