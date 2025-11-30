part of '../home_screen.dart';

class _CustomListViewTopGainers extends StatelessWidget {
  _CustomListViewTopGainers();

  List<TopGainersItemModel> items = [
    TopGainersItemModel(
      image: 'Ethereum (ETH)',
      name: 'Ethereum',
      symbol: 'ETH',
    ),
    TopGainersItemModel(
      image: 'Binance Coin (BNB)',
      name: 'Binance Coin',
      symbol: 'BNS',
    ),
    TopGainersItemModel(image: 'Vector', name: 'Litecoin', symbol: 'LTC'),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsExtension>()!;
    return Column(
      children: [
        SizedBox(height: 20),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Top Gainers',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeightsHelper.bold,
              color: colors.primary,
            ),
          ),
        ),
        SizedBox(height: 20),
        ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 12),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return _TopGainersItem(
              image: items[index].image,
              name: items[index].name,
              symbol: items[index].symbol,
              percent: '+1,15%',
              price: '\$20,788',
            );
          },
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}
