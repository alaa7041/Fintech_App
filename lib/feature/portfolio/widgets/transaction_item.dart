import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/core/widgets/portfolio_card.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/coins_formatte.dart';

enum TransactionType { buy, sell }

/// Individual transaction item
class TransactionItem extends StatelessWidget {
  final TransactionType type;
  final String cryptoName;
  final String timestamp;
  final double amount;
  final String symbol;
  final double valueUSD;

  const TransactionItem({
    super.key,
    required this.type,
    required this.cryptoName,
    required this.timestamp,
    required this.amount,
    required this.symbol,
    required this.valueUSD,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.theme;
    final isBuy = type == TransactionType.buy;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: PortfolioCard(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Transaction icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isBuy
                    ? colors.profitGreen.withValues(alpha: 0.1)
                    : colors.lossRed.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isBuy ? Icons.arrow_downward : Icons.arrow_upward,
                color: isBuy ? colors.profitGreen : colors.lossRed,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            // Transaction details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${isBuy ? 'Buy' : 'Sell'} $cryptoName',
                    style: TextStyle(
                      color: colors.primaryTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    timestamp,
                    style: TextStyle(
                      color: colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            // Amount
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$amount $symbol',
                  style: TextStyle(
                    color: colors.primaryTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${isBuy ? '+' : '-'}${valueUSD.formatCoins()}',
                  style: TextStyle(
                    color: isBuy ? colors.profitGreen : colors.lossRed,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
