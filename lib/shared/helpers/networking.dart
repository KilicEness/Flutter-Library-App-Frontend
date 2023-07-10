import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import './app_env.dart';
import './modular_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpResponse {
  dynamic data;
  dynamic headers;
  String? statusMessage;
  int? statusCode;

  HttpResponse(this.data, {this.headers, this.statusMessage, this.statusCode});
}

abstract class INetwork {
  Future<HttpResponse> get(String path,
      {Map<String, dynamic>? queryParameters, Options? options});
  Future<HttpResponse> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
  Future<HttpResponse> delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
  });
  Future<HttpResponse> put(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
  });

  Future<HttpResponse> patch(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}

class DioNetwork implements INetwork {
  // DioNetwork() {
  //   SharedPreferences.getInstance().then((value) {
  //     _dio.options.headers = {"x-auth": value.getString("token")};
  //   });
  // }

  Future<Dio> _dioInstance() async {
    var sharedPreferences = await SharedPreferences.getInstance();

    Dio instance = Dio(BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: 60 * 1000, // 60 seconds
        receiveTimeout: 60 * 1000, // 60 seconds
        baseUrl: kIsWeb ? AppEnv.apiUrl : "http://10.0.2.2:3000",
        validateStatus: (status) {
          return status! < 500;
        }));

    // instance.options.headers
    //     .addAll({"x-auth": sharedPreferences.getString("token") ?? ""});

    instance.interceptors.add(InterceptorsWrapper(
      onRequest: (e, handler) {
        e.headers.addAll({
          "Authorization": "Bearer ${sharedPreferences.getString("token") ?? "Token Not Found!"}"
        });
        return handler.next(e);
      },
      onResponse: (e, handler) {
        if (e.statusCode == 401) {
          ModularNavigator.toPush("/logout");
        } else {
          return handler.next(e);
        }
      },
    ));
    return instance;
  }

  @override
  Future<HttpResponse> get(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    var dio = await _dioInstance();
    var response =
        await dio.get(path, queryParameters: queryParameters, options: options);
    return HttpResponse(
      response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  @override
  Future<HttpResponse> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    var dio = await _dioInstance();
    var response = await dio.post(path,
        queryParameters: queryParameters, data: data, options: options);
    return HttpResponse(
      response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  @override
  Future<HttpResponse> delete(String path,
      {data, Map<String, dynamic>? queryParameters}) async {
    var dio = await _dioInstance();
    var response =
        await dio.delete(path, queryParameters: queryParameters, data: data);
    return HttpResponse(
      response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  @override
  Future<HttpResponse> put(String path,
      {data, Map<String, dynamic>? queryParameters}) async {
    var dio = await _dioInstance();
    var response =
        await dio.put(path, queryParameters: queryParameters, data: data);
    return HttpResponse(
      response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  @override
  Future<HttpResponse> patch(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    var dio = await _dioInstance();
    var response = await dio.patch(path,
        queryParameters: queryParameters, data: data, options: options);
    return HttpResponse(
      response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }
}
