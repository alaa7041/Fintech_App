import 'package:fintech_app/core/widgets/custom_app_bar.dart';
import 'package:fintech_app/features/market/presentation/screen/widgets/build_search.dart';
import 'package:fintech_app/features/market/presentation/screen/widgets/category_section.dart';
import 'package:fintech_app/features/market/presentation/screen/widgets/coin_section.dart';
import 'package:fintech_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/global/dimensions.dart';
import '../../../../core/theming/app_colors_extension.dart';
import '../../data/models/coin_model.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  final List<String> categories = ['All', 'DeFi', 'NFT', 'Gaming', 'Metaverse'];
  String selectedCategory = 'All';
  String search = '';

  final List<Coin> coins = [
    Coin(
      name: 'Bitcoin',
      rank: 1,
      price: '\$54,382.64',
      change: 15.3,
      color: Colors.orange,
      logo: Assets.imagesBitcoin,
    ),
    Coin(
      name: 'Bitcoin',
      rank: 1,
      price: '\$54,382.64',
      change: 15.3,
      color: Colors.orange,
      logo: Assets.imagesBitcoin,
    ),
    Coin(
      name: 'Bitcoin',
      rank: 1,
      price: '\$54,382.64',
      change: 15.3,
      color: Colors.orange,
      logo: Assets.imagesBitcoin,
    ),
    Coin(
      name: 'Bitcoin',
      rank: 1,
      price: '\$54,382.64',
      change: 15.3,
      color: Colors.orange,
      logo: Assets.imagesBitcoin,
    ),
    Coin(
      name: 'Bitcoin',
      rank: 1,
      price: '\$54,382.64',
      change: 15.3,
      color: Colors.orange,
      logo: Assets.imagesBitcoin,
    ),
    Coin(
      name: 'Bitcoin',
      rank: 1,
      price: '\$54,382.64',
      change: 15.3,
      color: Colors.orange,
      logo: Assets.imagesBitcoin,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = coins
        .where((c) => c.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
    final colors = Theme.of(context).extension<AppColorsExtension>()!;
    return Scaffold(
      appBar: CustomAppBar(title: 'Crypto Market'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            BuildSearch(
              colors: colors,
              search: search,
            ),
            const SizedBox(height: 16),
            CatergorySection(colors: colors, categories: categories),

            const SizedBox(height: 14),
            CoinSection(filtered: filtered, colors: colors),
          ],
        ),
      ),
    );
  }


}
