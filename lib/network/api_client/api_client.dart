import 'package:ten_twenty_test/network/api_client/api_client_core.dart';
import 'package:ten_twenty_test/network/endpoints.dart';

class ApiClient extends ApiClientCore {
  ApiClient(super.client);

  @override
  String get baseUrl => Endpoints.baseUrl;

  @override
  Duration get defaultConnectTimeout => const Duration(seconds: 100);

  @override
  Duration get defaultReceiveTimeout => const Duration(seconds: 100);
}
