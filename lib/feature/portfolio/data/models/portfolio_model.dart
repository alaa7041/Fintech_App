// lib/features/portfolio/data/models/portfolio_model.dart

import '../../domain/entities/portfolio_entity.dart';

class PortfolioModel extends PortfolioEntity {
  PortfolioModel({
    required String cryptoId,
    required String name,
    required String symbol,
    required String icon,
    required double amount,
    required String color,
  }) : super(
          cryptoId: cryptoId,
          name: name,
          symbol: symbol,
          icon: icon,
          amount: amount,
          color: color,
        );

  factory PortfolioModel.fromJson(Map<String, dynamic> json) {
    return PortfolioModel(
      cryptoId: json['crypto_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      symbol: json['symbol'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      color: json['color'] as String? ?? '#000000',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'crypto_id': cryptoId,
      'name': name,
      'symbol': symbol,
      'icon': icon,
      'amount': amount,
      'color': color,
    };
  }

  static List<PortfolioModel> getDefaultPortfolio() {
    return [
      PortfolioModel(
        cryptoId: 'bitcoin',
        name: 'Bitcoin',
        symbol: 'BTC',
        icon: '₿',
        amount: 0.05,
        color: '#F7931A',
      ),
      PortfolioModel(
        cryptoId: 'ethereum',
        name: 'Ethereum',
        symbol: 'ETH',
        icon: 'Ξ',
        amount: 1.5,
        color: '#627EEA',
      ),
      PortfolioModel(
        cryptoId: 'litecoin',
        name: 'Litecoin',
        symbol: 'LTC',
        icon: 'Ł',
        amount: 60.1,
        color: '#345D9D',
      ),
    ];
  }
}