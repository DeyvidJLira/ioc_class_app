import 'package:ioc_class_app/domain/model/api_response.model.dart';
import 'package:ioc_class_app/domain/model/exchange.model.dart';
import 'package:ioc_class_app/repository/exchange.respository_impl.dart';
import 'package:mobx/mobx.dart';

part 'exchanges.controller.g.dart';

class ExchangesController = ExchangesControllerBase with _$ExchangesController;

abstract class ExchangesControllerBase with Store {
  @readonly
  Exchange _exchangeBase =
      Exchange(coinCode: "USD", coinName: "Dólar Americano", bid: 100);

  final ExchangeRepository _repository = ExchangeRepository();

  APIResponse<Exchange> _exchangeResponse = APIResponse.loading();

  @readonly
  bool _isLoading = false;

  final ObservableSet<Exchange> exchanges = ObservableSet();

  @action
  changeValueBase(int newValue) {
    if (newValue > 0) {
      _exchangeBase = Exchange(
          coinCode: "USD",
          coinName: "Dólar Americano",
          bid: newValue.toDouble());
    }
  }

  @action
  searchCoinCode(String code) async {
    _isLoading = true;
    _exchangeResponse =
        await _repository.getByCoinCode("${_exchangeBase.coinCode}-$code");
    if (_exchangeResponse.isSuccess) {
      add(_exchangeResponse.data!);
    }
    _isLoading = false;
  }

  @action
  add(Exchange exchange) {
    exchanges.add(exchange);
  }

  @action
  remove(Exchange exchange) {
    exchanges.remove(exchange);
  }
}
