
import 'package:flutter/material.dart';

import '../../../../../core/global/dimensions.dart';
import '../../../../../core/theming/app_colors_extension.dart';
import '../../../data/models/coin_model.dart';

class CoinSection extends StatelessWidget {
  const CoinSection({
    super.key,
    required this.filtered,
    required this.colors,
  });

  final List<Coin> filtered;
  final AppColorsExtension colors;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: filtered.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final coin = filtered[index];
          return Container(

            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: colors.btnTextColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                      child: Image.asset(
                        coin.logo,
                        width: 40,
                        height: 40,
                        fit: BoxFit.fill,
                      )
                  ),
                ),
                const SizedBox(width: 12),
                // name and rank
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coin.name,
                        style:  TextStyle(
                          fontSize: 20.font,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Rank #${coin.rank}',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      coin.price,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: coin.change >= 0
                            ? Colors.green
                            : Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            coin.change >= 0
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            size: 16,
                            color: colors.btnTextColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${coin.change.abs().toStringAsFixed(1)}%',
                            style: TextStyle(
                              color: colors.btnTextColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
