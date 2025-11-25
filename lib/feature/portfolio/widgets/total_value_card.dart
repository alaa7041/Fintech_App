import 'package:flutter/material.dart';

/// Total value card with gradient background
class TotalValueCard extends StatelessWidget {
  final double totalValue;
  final double changePercentage;
  final double changeAmount;

  const TotalValueCard({
    super.key,
    required this.totalValue,
    required this.changePercentage,
    required this.changeAmount,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = changePercentage >= 0;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: const [Color(0xff2D5189), Color(0xff1D3A70)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Value',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '\$${totalValue.toStringAsFixed(2)}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                '${isPositive ? '+' : ''}${changePercentage.toStringAsFixed(1)}%',
                style: TextStyle(
                  color: isPositive
                      ? const Color(0xff2ECC71)
                      : const Color(0xffE74C3C),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '(\$${changeAmount.toStringAsFixed(2)}) Today',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 14,
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
