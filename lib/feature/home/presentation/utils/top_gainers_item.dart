part of '../home_screen.dart';

class _TopGainersItem extends StatelessWidget {
  final String image;
  final String name;
  final String symbol;
  final String price;
  final String percent;

  const _TopGainersItem({
    required this.image,
    required this.name,
    required this.symbol,
    required this.percent,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.theme;
    return Container(
      width: 343,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.btnTextColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors.grey.withOpacity(0.2),
            ),
            child: SvgPicture.asset(
              Utils.getImagesSVGPath(image),
              width: 13,
              height: 21,

              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeightsHelper.bold,
                    color: colors.primaryTextColor,
                  ),
                  maxLines: 1,
                ),
                SizedBox(height: 4),
                Text(
                  symbol,
                  style: TextStyle(
                    fontSize: 14,
                    color: colors.grey,
                    fontWeight: FontWeightsHelper.medium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                price,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeightsHelper.medium,
                  color: colors.primaryTextColor,
                ),
              ),
              SizedBox(height: 4),
              Text(
                percent,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeightsHelper.regular,
                  color: colors.secondaryTextColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
