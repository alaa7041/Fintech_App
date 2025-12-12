
import '../entities/crypto_entity.dart';

abstract class CryptoRepository {
  Future<List<CryptoEntity>> getCryptoPrices();
}