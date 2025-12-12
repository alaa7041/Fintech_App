
import 'crypto_entity.dart';
import 'portfolio_entity.dart';

class PortfolioWithPriceEntity {
  final PortfolioEntity portfolio;
  final CryptoEntity crypto;

  PortfolioWithPriceEntity({
    required this.portfolio,
    required this.crypto,
  });

  double get currentValue => portfolio.amount * crypto.usd;

  double get change24h => crypto.change24h;

  bool get isPositive => change24h >= 0;

  double getPercentage(double totalValue) {
    if (totalValue == 0) return 0;
    return (currentValue / totalValue) * 100;
  }
}