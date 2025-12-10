part of '../home_screen.dart';

class _TrendingCoinCard extends StatelessWidget {
  final String name;
  final String symbol;
  final String price;
  final String percentage;
  final bool isPositive;

  const _TrendingCoinCard({
    required this.name,
    required this.symbol,
    required this.price,
    required this.percentage,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.theme;

    return Container(
      width: 192,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
         color: colors.btnTextColor,
         borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              color: colors.primaryTextColor,
              fontSize: 14,
              fontWeight: FontWeightsHelper.medium,
            ),
          ),
          SizedBox(height: 4),
          Text(
            symbol,
            style: TextStyle(
              color: colors.grey,
              fontSize: 12,
              fontWeight: FontWeightsHelper.regular,
            ),
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Text(
                price,
                style: TextStyle(
                  color: colors.primaryTextColor,
                  fontSize: 20,
                  fontWeight: FontWeightsHelper.medium,
                ),
              ),
              Spacer(),
              Text(
                percentage,
                style: TextStyle(
                  color: isPositive ? Color(0xFF4766F9) : Color(0xFFEF4444),
                  fontSize: 12,
                  fontWeight: FontWeightsHelper.regular,
                ),
              ),
              SizedBox(width: 4),
              Icon(
                isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                color: isPositive ? Color(0xFF4766F9) : Color(0xFFEF4444),
                size: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
