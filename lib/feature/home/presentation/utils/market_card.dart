
part of '../home_screen.dart';

class _MarketCard extends StatelessWidget {
  final String title;
  final String value;
  final String? percentage;
  final bool? isPositive;
  const _MarketCard({
    required this.title,
    required this.value,
    this.percentage,
    this.isPositive,
  });
  @override
  Widget build(BuildContext context) {
      final colors = Theme.of(context).extension<AppColorsExtension>()!; 
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: colors.primaryTextColor,
              fontSize: 14,
              fontWeight: FontWeightsHelper.medium,
            ),
          ),
          SizedBox(height: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
              color: colors.primaryTextColor,
                  fontSize: 24,
                  fontWeight: FontWeightsHelper.bold,
                ),
              ),
              if (percentage != null) ...[
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      percentage!,
                      style: TextStyle(
                        color: isPositive!
                            ? Color(0xFF4766F9)
                            : Color(0xFFEF4444),
                        fontSize: 12,
                        fontWeight: FontWeightsHelper.semiBold,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      isPositive! ? Icons.arrow_upward : Icons.arrow_downward,
                      color: isPositive!
                          ? Color(0xFF4766F9)
                          : Color(0xFFEF4444),
                      size: 12,
                    ),
                  ],
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
