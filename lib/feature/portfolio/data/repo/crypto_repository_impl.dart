
import 'package:fintech_app/feature/portfolio/data/datasource/crypto_remote_datasource.dart';

import '../../domain/entities/crypto_entity.dart';
import '../../domain/repositories/crypto_repository.dart';

class CryptoRepositoryImpl implements CryptoRepository {
  final CryptoRemoteDataSource remoteDataSource;

  CryptoRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<CryptoEntity>> getCryptoPrices() async {
    try {
      final models = await remoteDataSource.getCryptoPrices();
      return models; 
    } catch (e) {
      throw Exception('Failed to get crypto prices: $e');
    }
  }
}