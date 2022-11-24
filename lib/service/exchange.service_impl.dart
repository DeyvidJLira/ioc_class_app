import 'package:dio/dio.dart';
import 'package:ioc_class_app/strings.dart';

class ExchangeService {
  final options =
      BaseOptions(baseUrl: "https://economia.awesomeapi.com.br/json");

  Future<Response> getByCoinCode(String code) async {
    try {
      return await Dio(options).get("/last/$code");
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response!;
      }
      throw Exception(Strings.BACKEND_GENERIC_ERROR);
    }
  }
}
