
import 'package:dio/dio.dart';
import 'package:fintech_app/core/network_utils/api_error_handler.dart';
import '../models/crypto_model.dart';

abstract class CryptoRemoteDataSource {
  Future<List<CryptoModel>> getCryptoPrices();
}

class CryptoRemoteDataSourceImpl implements CryptoRemoteDataSource {
  final Dio dio;

  CryptoRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CryptoModel>> getCryptoPrices() async {
    try {
      final response = await dio.get(
        'https://api.coingecko.com/api/v3/simple/price?vs_currencies=usd&ids=ethereum%2Cbitcoin%2Ctether%2Csolana%2Cavalanche%2Clitecoin&names=Bitcoin&symbols=btc%2Ceth%2Cltc&include_24hr_vol=true&include_24hr_change=true&include_market_cap=true&include_last_updated_at=true&include_tokens=top&precision=1',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return CryptoModel.fromJsonResponse(data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: 'Failed to load crypto prices',
        );
      }
    } on DioException catch (e) {
      throw ApiErrorHandler.handle(e);
    } catch (e) {
      throw Exception('Unexpected error: $e');
}
  }
}