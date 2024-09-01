import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/features/posts/presentaion/bloc/posts/posts_event.dart';
import 'package:my_app/features/posts/presentaion/bloc/posts/posts_states.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/map_states_to_message/map_states_to_message.dart';
import '../../../../../core/strings/failures.dart';
import '../../../domain/entities/post.dart';
import '../../../domain/use_cases/get_all_posts.dart';

class PostsBloc extends Bloc<PostsEvent, PostStates> {
  final GetAllPostsUseCase getAllPostsUseCase;

  PostsBloc({required this.getAllPostsUseCase}) : super(InitPostsState()) {
    on<PostsEvent>((event, emit) async {
      if (event is GetAllPostsEvent) {
        emit(LoadingPostsState());
        final posts = await getAllPostsUseCase();
        emit(leftOrRight(posts));
      } else if (event is RefreshPostsEvent) {
        emit(LoadingPostsState());
        final posts = await getAllPostsUseCase();
        emit(leftOrRight(posts));
      }
    });
  }

  PostStates leftOrRight(Either<Failure, List<Post>> either) => either.fold(
      (failure) => ErrorPostsState(message: mapFailureToMessage(failure)),
      (posts) => LoadedPostsState(posts: posts));
}
