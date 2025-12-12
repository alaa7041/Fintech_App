
class CryptoEntity {
  final String id;
  final double usd;
  final double marketCap;
  final double volume24h;
  final double change24h;
  final int lastUpdatedAt;

  CryptoEntity({
    required this.id,
    required this.usd,
    required this.marketCap,
    required this.volume24h,
    required this.change24h,
    required this.lastUpdatedAt,
  });
}