import 'package:dio/dio.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/data/repositories/shipping/shipping.dart';
import 'package:moniepoint/domain/domain.dart';
import 'package:moniepoint/services/services.dart';

class Repository {
  final ShippingRepositoryInterface shipping;
  Repository({required this.shipping});
}

class RepositoryFactory {
  static Future<Repository> make(Env environment, [Dio? dio]) async {
    if (!environment.isProd) {
      return Repository(shipping: FakeShippingRepository());
    }
    final httpClient = DioHttpClient(dio ?? Dio());
    return Repository(shipping: ShippingRepositoryImpl(httpClient));
  }
}
