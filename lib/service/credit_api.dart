import 'package:dio/dio.dart';
import 'package:kredit_app/model/credit_model.dart';

class CreditApi {
  final Dio _dio = Dio();

  final baseUrl = "http://10.0.2.2:5000/";

  CreditApi() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          if (e.response!.statusCode == 401) {
          } else {}
          return handler.next(e);
        },
      ),
    );
  }

  Future<bool> predict({required CreditModel credit}) async {
    try {
      final response = await _dio.post(
        baseUrl,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: credit.toJson(),
      );
      bool result = response.data['data'];
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> check() async {
    try {
      final response = await _dio.get(
        baseUrl,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      String result = response.data['data'];
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
