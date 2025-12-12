
import '../../domain/entities/crypto_entity.dart';

class CryptoModel extends CryptoEntity {
  CryptoModel({
    required String id,
    required double usd,
    required double marketCap,
    required double volume24h,
    required double change24h,
    required int lastUpdatedAt,
  }) : super(
          id: id,
          usd: usd,
          marketCap: marketCap,
          volume24h: volume24h,
          change24h: change24h,
          lastUpdatedAt: lastUpdatedAt,
        );

  factory CryptoModel.fromJson(String id, Map<String, dynamic> json) {
    return CryptoModel(
      id: id,
      usd: (json['usd'] as num?)?.toDouble() ?? 0.0,
      marketCap: (json['usd_market_cap'] as num?)?.toDouble() ?? 0.0,
      volume24h: (json['usd_24h_vol'] as num?)?.toDouble() ?? 0.0,
      change24h: (json['usd_24h_change'] as num?)?.toDouble() ?? 0.0,
      lastUpdatedAt: json['last_updated_at'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'usd': usd,
      'usd_market_cap': marketCap,
      'usd_24h_vol': volume24h,
      'usd_24h_change': change24h,
      'last_updated_at': lastUpdatedAt,
    };
  }

  static List<CryptoModel> fromJsonResponse(Map<String, dynamic> response) {
    List<CryptoModel> cryptos = [];
    response.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        cryptos.add(CryptoModel.fromJson(key, value));
      }
    });
    return cryptos;
  }
}