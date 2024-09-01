import 'package:equatable/equatable.dart';
import 'package:my_app/features/posts/domain/entities/post.dart';

abstract class PostsActionEvent extends Equatable {
  const PostsActionEvent();

  @override
  List<Object?> get props => [];
}

class AddPostsActionEvent extends PostsActionEvent {
  final Post post;

  const AddPostsActionEvent({required this.post});

  @override
  List<Object?> get props => [post];
}

class UpdatePostsActionEvent extends PostsActionEvent {
  final Post post;

  const UpdatePostsActionEvent({required this.post});

  @override
  List<Object?> get props => [post];
}

class DeletePostsActionEvent extends PostsActionEvent {
  final int id;

  const DeletePostsActionEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
