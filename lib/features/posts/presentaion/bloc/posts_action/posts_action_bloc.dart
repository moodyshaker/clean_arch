import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/map_states_to_message/map_states_to_message.dart';
import 'package:my_app/core/strings/messages.dart';
import 'package:my_app/features/posts/domain/use_cases/delete_post.dart';
import 'package:my_app/features/posts/domain/use_cases/update_post.dart';
import 'package:my_app/features/posts/presentaion/bloc/posts_action/posts_action_events.dart';
import 'package:my_app/features/posts/presentaion/bloc/posts_action/posts_action_states.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/use_cases/add_post.dart';

class PostsActionBloc extends Bloc<PostsActionEvent, PostActionStates> {
  final AddPostUseCase addPostUseCase;
  final DeletePostUseCase deletePostUseCase;
  final UpdatePostUseCase updatePostUseCase;

  PostsActionBloc(
      {required this.addPostUseCase,
      required this.deletePostUseCase,
      required this.updatePostUseCase})
      : super(InitActionPostsState()) {
    on<PostsActionEvent>((event, emit) async {
      if (event is AddPostsActionEvent) {
        emit(LoadingActionPostsState());
        final result = await addPostUseCase(event.post);
        emit(leftOrRight(result, ADD_SUCCESS_MESSAGE));
      } else if (event is UpdatePostsActionEvent) {
        emit(LoadingActionPostsState());
        final result = await updatePostUseCase(event.post);
        emit(leftOrRight(result, UPDATE_SUCCESS_MESSAGE));
      } else if (event is DeletePostsActionEvent) {
        emit(LoadingActionPostsState());
        final result = await deletePostUseCase(event.id);
        emit(leftOrRight(result, DELETE_SUCCESS_MESSAGE));
      }
    });
  }

  PostActionStates leftOrRight(Either<Failure, Unit> either, String message) =>
      either.fold(
          (failure) =>
              ErrorActionPostsState(message: mapFailureToMessage(failure)),
          (_) => MessageActionPostsState(message: message));
}
