
class PortfolioEntity {
  final String cryptoId;
  final String name;
  final String symbol;
  final String icon;
  final double amount;
  final String color;

  PortfolioEntity({
    required this.cryptoId,
    required this.name,
    required this.symbol,
    required this.icon,
    required this.amount,
    required this.color,
  });

  double getValue(double price) => amount * price;

  double getPercentage(double totalValue, double price) {
    if (totalValue == 0) return 0;
    final value = getValue(price);
    return (value / totalValue) * 100;
  }
}