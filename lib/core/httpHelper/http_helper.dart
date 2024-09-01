import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../router/router.dart';
import 'header_config.dart';

// final String base_url = 'https://newsapi.org/v2/';
final String base_url = 'https://jsonplaceholder.typicode.com/';

class HttpHelper {
  static final HttpHelper instance = HttpHelper._instance();

  HttpHelper._instance();

  Future<Response> httpPost(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    final Response r = await post(Uri.parse('$base_url$path'),
        body: json.encode(body), headers: await HeaderConfig.getHeader());
    log('request URL -> ${r.request!.url}');
    log('statusCode -> ${r.statusCode}');
    log('response -> ${r.body}');
    return r;
  }

  Future<Response> httpDelete(String path, {Map<String, dynamic>? body}) async {
    final Response r = await delete(Uri.parse('$base_url$path'),
        body: body == null ? null : json.encode(body),
        headers: await HeaderConfig.getHeader());
    log('request URL -> ${r.request!.url}');
    log('statusCode -> ${r.statusCode}');
    log('response -> ${r.body}');
    return r;
  }

  Future<Response> httpGet(String path) async {
    final Response r = await get(Uri.parse('${base_url}$path'),
        headers: await HeaderConfig.getHeader());
    log('request URL -> ${r.request!.url}');
    log('statusCode -> ${r.statusCode}');
    log('response -> ${r.body}');
    return r;
  }

  Future<Response> httpPut(String path,
      {Map<String, dynamic>? body}) async {
    final Response r = await put(Uri.parse('$base_url$path'),
        body: json.encode(body),
        headers: await HeaderConfig.getHeader());
    log('request URL -> ${r.request!.url}');
    log('statusCode -> ${r.statusCode}');
    log('response -> ${r.body}');
    return r;
  }
}
