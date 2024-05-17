import 'package:dio/dio.dart';
import 'dart:convert' show json;
import 'package:rhema_mena_student_app/common/network/dio_exception.dart';
import 'package:rhema_mena_student_app/core/app_extension.dart';

abstract mixin class ApiHelper<T> {
  late final T data;

  Future<bool> _requestMethodTemplate(
      Future<Response<dynamic>> apiCallback) async {
    final Response response = await apiCallback;
    if (response.statusCode.success) {
      return true;
    } else {
      throw DioExceptions;
    }
  }

  //Generic Method template for create item on server
  Future<bool> makePostRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  //Generic Method template for update item on server
  Future<bool> makePutRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  //Generic Method template for delete item from server
  Future<bool> makeDeleteRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  //Generic Method template for get data from Api
  Future<List<T>> makeGetRequest(Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    final Response response = await apiCallback;

    var encoded = json.decode(json.encode(response.data));
    var courses = encoded['courses']; // courses hardcoded...for debugging

    final List<T> items = List<T>.from(
      courses.map((item) => getJsonCallback(item))
      // json
      //     .decode(json.encode(response.data))
          // .map((item) => getJsonCallback(item)),
    );
    if (response.statusCode.success) {
      return items;
    } else {
      throw DioExceptions;
    }
  }

  //Generic Method template for get data from Api, Bool Type
  Future<bool> makeBoolGetRequest(Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    try {
      final Response response = await apiCallback;

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw DioExceptions;
    }
  }

  // Function template to make a PATCH request to the server
  Future<bool> makePatchRequest(Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    try {
      final Response response = await apiCallback;
      if (response.statusCode.success) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw DioExceptions;
    }
  }
}
