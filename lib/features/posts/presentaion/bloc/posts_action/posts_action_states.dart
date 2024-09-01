import 'package:equatable/equatable.dart';

import '../../../domain/entities/post.dart';

abstract class PostActionStates extends Equatable {
  @override
  List<Object> get props => [];
}

class InitActionPostsState extends PostActionStates {}

class LoadingActionPostsState extends PostActionStates {}

class MessageActionPostsState extends PostActionStates {
  final String message;

  MessageActionPostsState({required this.message});

  @override
  List<Object> get props => [message];
}

class ErrorActionPostsState extends PostActionStates {
  final String message;

  ErrorActionPostsState({required this.message});

  @override
  List<Object> get props => [message];
}
