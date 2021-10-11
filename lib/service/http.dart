import 'package:dio/dio.dart';

class HttpService {
  late Dio _dio;

  final baseUrl = "https://jsonplaceholder.typicode.com/";

  HttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));

    initializeInterceptors();
  }

  Future<Response> _request(String path,
      {required String method, Map<String, dynamic>? queryParameters}) async {
    Response response;
    try {
      response = await _dio.request(
        path,
        queryParameters: queryParameters,
        options: Options(method: method),
      );
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return _request(path, method: 'get', queryParameters: queryParameters);
  }

  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("${options.method} ${options.path}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          return handler.next(e);
        },
      ),
    );
  }
}
