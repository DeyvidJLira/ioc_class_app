import 'package:ioc_class_app/domain/model/api_response.model.dart';
import 'package:ioc_class_app/domain/model/exchange.model.dart';
import 'package:ioc_class_app/domain/repository/exchange.repository.dart';

class ExchangeMockRepositoryImpl implements ExchangeRepository {
  @override
  Future<APIResponse<Exchange>> getByCoinCode(String code) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return APIResponse.success(Exchange(
        coinCode: "BRL",
        coinName: "Real Brasileiro",
        bid: 1.85,
        percentChange: 2.85));
  }
}
