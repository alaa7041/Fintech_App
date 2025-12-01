
part of '../home_screen.dart';

class _CustomGridView extends StatelessWidget {
  const _CustomGridView();


  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsExtension>()!;
    return Column(
      children: [
        SizedBox(height: 20),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Market Overview',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeightsHelper.bold,
              color: colors.primary,
            ),
          ),
        ),
        SizedBox(height: 20),
        GridView.count(
          
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.3,
          children: [
            _MarketCard(
              title: 'Market Cap',
              value: '\$2.1T',
              percentage: '2.35%',
              isPositive: true,
            ),
            _MarketCard(
              title: '24h Volume',
              value: '\$85.5B',
              percentage: '2.35%',
              isPositive: true,
            ),
            _MarketCard(
              title: 'BTC Dominance',
              value: '48.5%',
              percentage: null,
              isPositive: null,
            ),
            _MarketCard(
              title: 'Active Coins',
              value: '19,417',
              percentage: null,
              isPositive: null,
            ),
          ],
        ),
      ],
    );
  }
}
