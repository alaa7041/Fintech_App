
import '../entities/crypto_entity.dart';
import '../entities/portfolio_entity.dart';
import '../entities/portfolio_with_price_entity.dart';
import '../repositories/crypto_repository.dart';

class GetPortfolioUseCase {
  final CryptoRepository repository;

  GetPortfolioUseCase(this.repository);

  Future<PortfolioResult> call(List<PortfolioEntity> localPortfolio) async {
    final cryptoPrices = await repository.getCryptoPrices();

    final portfolioWithPrices = <PortfolioWithPriceEntity>[];
    
    for (var portfolio in localPortfolio) {
      final crypto = cryptoPrices.firstWhere(
        (c) => c.id == portfolio.cryptoId,
        orElse: () => throw Exception('Crypto not found: ${portfolio.cryptoId}'),
      );
      
      portfolioWithPrices.add(
        PortfolioWithPriceEntity(
          portfolio: portfolio,
          crypto: crypto,
        ),
      );
    }

    final totalValue = portfolioWithPrices.fold<double>(
      0,
      (sum, item) => sum + item.currentValue,
    );

    return PortfolioResult(
      items: portfolioWithPrices,
      totalValue: totalValue,
    );
  }
}

class PortfolioResult {
  final List<PortfolioWithPriceEntity> items;
  final double totalValue;

  PortfolioResult({
    required this.items,
    required this.totalValue,
  });

  double get total24hChange {
    return items.fold<double>(
      0,
      (sum, item) => sum + (item.currentValue * item.change24h / 100),
    );
  }

  double get total24hChangePercentage {
    if (totalValue == 0) return 0;
    return (total24hChange / totalValue) * 100;
  }
}