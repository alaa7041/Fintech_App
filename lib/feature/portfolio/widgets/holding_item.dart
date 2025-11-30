import 'dart:math';

import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/core/widgets/portfolio_card.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/coins_formatte.dart';

/// Individual holding item card
class HoldingItem extends StatelessWidget {
  final String symbol;
  final String name;
  final double amount;
  final double valueUSD;
  final double portfolioPercentage;
  final double profitLossAmount;
  final double profitLossPercentage;
  final Color? iconColor;

  const HoldingItem({
    super.key,
    required this.symbol,
    required this.name,
    required this.amount,
    required this.valueUSD,
    required this.portfolioPercentage,
    required this.profitLossAmount,
    required this.profitLossPercentage,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.theme;
    final isProfit = profitLossAmount >= 0;

    return PortfolioCard(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Crypto icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color:
                  iconColor?.withValues(alpha: 0.2) ??
                  colors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                symbol[0],
                style: TextStyle(
                  color: iconColor ?? colors.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Crypto name and amount
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: colors.primaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$amount $symbol',
                  style: TextStyle(
                    color: colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  valueUSD.formatCoins(),
                  style: TextStyle(
                    color: Random().nextBool()
                        ? Color(0xffF56C2A)
                        : colors.secondaryTextColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          // Portfolio percentage and profit/loss
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                portfolioPercentage.formatCoins(),
                style: TextStyle(
                  color: colors.primaryTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${isProfit ? '+' : ''}\$${profitLossAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: isProfit ? colors.profitGreen : colors.lossRed,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${isProfit ? '+' : ''}${profitLossPercentage.toStringAsFixed(2)}%',
                style: TextStyle(
                  color: isProfit ? colors.profitGreen : colors.lossRed,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
