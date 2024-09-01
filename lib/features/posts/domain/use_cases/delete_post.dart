import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/posts_repository.dart';

class DeletePostUseCase {
  final PostsRepository repository;

  DeletePostUseCase(this.repository);

  Future<Either<Failure, Unit>> call(int id) async =>
      await repository.deletePost(id);
}
