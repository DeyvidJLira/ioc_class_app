import 'package:ioc_class_app/domain/model/api_response.model.dart';
import 'package:ioc_class_app/domain/model/exchange.model.dart';

abstract class ExchangeRepository {
  Future<APIResponse<Exchange>> getByCoinCode(String code);
}
