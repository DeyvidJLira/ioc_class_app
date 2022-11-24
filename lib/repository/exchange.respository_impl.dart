import 'package:ioc_class_app/domain/model/api_response.model.dart';
import 'package:ioc_class_app/domain/model/exchange.model.dart';
import 'package:ioc_class_app/service/exchange.service_impl.dart';
import 'package:ioc_class_app/strings.dart';

class ExchangeRepository {
  final ExchangeService _service = ExchangeService();

  Future<APIResponse<Exchange>> getByCoinCode(String code) async {
    try {
      final response = await _service.getByCoinCode(code);
      if (response.statusCode == 200) {
        final dataObject = Map<String, dynamic>.from(response.data);
        final codeSearched = code.replaceFirst("-", "");
        final item = Exchange.fromJson(codeSearched, dataObject);
        return APIResponse.success(item);
      } else {
        return APIResponse.error(Strings.BACKEND_FAILED_OPERATION);
      }
    } on Exception catch (e) {
      return APIResponse.error(e.toString());
    }
  }
}
