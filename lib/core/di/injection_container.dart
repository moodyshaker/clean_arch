import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_app/core/appStorage/local_storage.dart';
import 'package:my_app/features/posts/data/data_sources/post_local_data_source.dart';
import 'package:my_app/features/posts/data/data_sources/post_remote_data_source.dart';
import 'package:my_app/features/posts/data/repositories/post_repository_impl.dart';
import 'package:my_app/features/posts/domain/use_cases/add_post.dart';
import 'package:my_app/features/posts/domain/use_cases/delete_post.dart';
import 'package:my_app/features/posts/domain/use_cases/get_all_posts.dart';
import 'package:my_app/features/posts/domain/use_cases/update_post.dart';
import 'package:my_app/features/posts/presentaion/bloc/posts/posts_bloc.dart';
import 'package:my_app/features/posts/presentaion/bloc/posts_action/posts_action_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network_status/network_status.dart';

final sl = GetIt.I;

Future<void> initInjections() async {
  // Bloc

  sl.registerFactory<PostsBloc>(() => PostsBloc(getAllPostsUseCase: sl()));
  sl.registerFactory<PostsActionBloc>(() => PostsActionBloc(
        deletePostUseCase: sl(),
        addPostUseCase: sl(),
        updatePostUseCase: sl(),
      ));

  // UseCases

  sl.registerLazySingleton<GetAllPostsUseCase>(() => GetAllPostsUseCase(sl()));
  sl.registerLazySingleton<AddPostUseCase>(() => AddPostUseCase(sl()));
  sl.registerLazySingleton<DeletePostUseCase>(() => DeletePostUseCase(sl()));
  sl.registerLazySingleton<UpdatePostUseCase>(() => UpdatePostUseCase(sl()));

  // Repository

  sl.registerLazySingleton<PostRepositoryImpl>(() => PostRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkStatus: sl()));

  // Data Source

  sl.registerLazySingleton<PostRemoteDataSourceImpl>(
      () => PostRemoteDataSourceImpl());
  sl.registerLazySingleton<PostLocalDataSourceImpl>(
      () => PostLocalDataSourceImpl());

  // Core

  sl.registerLazySingleton<NetworkStatusImpl>(() => NetworkStatusImpl(sl()));

  // External

  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  SharedPreferences sp = (await Preferences.instance.initPref())!;

  sl.registerLazySingleton<SharedPreferences>(() => sp);
}
