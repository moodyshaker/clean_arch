import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:my_app/core/errors/exceptions.dart';
import 'package:my_app/features/posts/data/model/post_model.dart';

import '../../../../core/httpHelper/http_helper.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();

  Future<Unit> deletePost(int id);

  Future<Unit> addPost(PostModel postModel);

  Future<Unit> updatePost(PostModel post);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  @override
  Future<Unit> addPost(PostModel postModel) async {
    Response r = await HttpHelper.instance.httpPost('posts', body: {
      'title': postModel.title,
      'body': postModel.body,
    });
    if (r.statusCode >= 200 && r.statusCode < 300) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePost(int id) async {
    Response r = await HttpHelper.instance.httpDelete('posts/$id');
    if (r.statusCode >= 200 && r.statusCode < 300) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PostModel>> getAllPosts() async {
    Response r = await HttpHelper.instance.httpGet('posts');
    if (r.statusCode >= 200 && r.statusCode < 300) {
      List<PostModel> postModels = (json.decode(r.body) as List)
          .map((e) => PostModel.fromJson(e))
          .toList();
      return postModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePost(PostModel post) async {
    Response r = await HttpHelper.instance.httpPut('posts/${post.id}', body: {
      'title': post.title,
      'body': post.body,
    });
    if (r.statusCode >= 200 && r.statusCode < 300) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
