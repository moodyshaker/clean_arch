import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:my_app/core/appStorage/local_storage.dart';
import 'package:my_app/core/errors/exceptions.dart';

import '../model/post_model.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getCachePosts();

  Future<Unit> cachePosts(List<PostModel> postModels);
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  @override
  Future<Unit> cachePosts(List<PostModel> postModels) async {
    List postModelToJson = postModels.map((e) => e.toJson()).toList();
    await Preferences.instance.cachedPosts(json.encode(postModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachePosts() {
    final cachedPosts = Preferences.instance.getCachedPosts;
    if (cachedPosts.isNotEmpty) {
      List<PostModel> postModels = (json.decode(cachedPosts) as List)
          .map((e) => PostModel.fromJson(e))
          .toList();
      return Future.value(postModels);
    }else{
      throw EmptyCacheException();
    }
  }
}
