import 'dart:math' as math;

import 'package:fintech_app/core/extensions/coins_formatte.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class PortfolioAsset {
  final String symbol;
  final String name;
  final double percentage;
  final double value;
  final Color color;

  const PortfolioAsset({
    required this.symbol,
    required this.name,
    required this.percentage,
    required this.value,
    required this.color,
  });
}

/// Portfolio chart widget with pie chart and legend
class PortfolioChartWidget extends StatelessWidget {
  final double totalValue;
  final List<PortfolioAsset> assets;

  const PortfolioChartWidget({
    super.key,
    required this.totalValue,
    required this.assets,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.theme;

    return Row(
      children: [
        // Pie chart with center value
        SizedBox(
          height: 120,
          width: 120,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: const Size(120, 120),
                painter: PieChartPainter(
                  assets: assets,
                  bgColor: colors.cardBackground,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    totalValue.formatCoins(),
                    style: TextStyle(
                      color: colors.primaryTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 24),
        // Legend
        Expanded(
          child: Column(
            children: [
              ...assets.asMap().entries.map(
                (asset) => Padding(
                  padding: EdgeInsets.only(
                    bottom: asset.key == assets.length - 1 ? 0 : 8,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: asset.value.color,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          '${asset.value.value.formatCoins()} ${asset.value.symbol}',
                          style: TextStyle(
                            color: colors.primaryTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PieChartPainter extends CustomPainter {
  final List<PortfolioAsset> assets;
  final Color bgColor;

  PieChartPainter({required this.assets, required this.bgColor});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    double startAngle = -math.pi / 2;

    for (final asset in assets) {
      final sweepAngle = 2 * math.pi * (asset.percentage / 100);

      final paint = Paint()
        ..color = asset.color
        ..style = PaintingStyle.fill;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );

      startAngle += sweepAngle;
    }

    // Draw white center circle to create donut effect
    final centerPaint = Paint()
      ..color = bgColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius * 0.8, centerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
