part of '../home_screen.dart';

class _CustomListViewTrending extends StatelessWidget {
  const _CustomListViewTrending({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsExtension>()!;
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Trending Now',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeightsHelper.bold,
                color: colors.primaryTextColor,
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                'View all',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeightsHelper.medium,
                  color: colors.primaryTextColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 132,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _TrendingCoinCard(
                  isPositive: true,
                  name: 'Bitcoin',
                  percentage: '2,35%',
                  price: '1,132,151',
                  symbol: 'BTC',
                ),
              );
            },
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
