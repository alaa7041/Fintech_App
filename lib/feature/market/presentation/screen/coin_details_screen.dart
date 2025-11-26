import 'package:fintech_app/core/widgets/custom_app_bar.dart';
import 'package:fintech_app/feature/market/presentation/screen/widgets/about_section.dart';
import 'package:fintech_app/feature/market/presentation/screen/widgets/button_section.dart';
import 'package:fintech_app/feature/market/presentation/screen/widgets/line_chart_widget.dart';
import 'package:fintech_app/feature/market/presentation/screen/widgets/statics_section.dart';
import 'package:flutter/material.dart';
import '../../../../core/global/dimensions.dart';
import '../../../../core/theming/app_colors_extension.dart';

class CoinDetailsScreen extends StatefulWidget {
  const CoinDetailsScreen({super.key});

  @override
  State<CoinDetailsScreen> createState() => _CoinDetailsScreenState();
}

class _CoinDetailsScreenState extends State<CoinDetailsScreen> {
  final Map<String, String> stats = {
    'Market Cap': '\$1.02T',
    '24H Volume': '\$36.5B',
    'Circulating Supply': '18.7M BTC',
    'Max Supply': '21M BTC',
    'All-Time High': '\$64,863.10',
    'All-Time Low': '\$67.81',
  };

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsExtension>()!;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Coin Details',
        isCenterTitle: true,
        withArrow: true,
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/bitcoin.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Bitcoin',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.font,
                          color: colors.primaryTextColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  LineChartWidget(),
                  StaticsSection(stats: stats, colors: colors),
                  const SizedBox(height: 18),
                  AboutSection(colors: colors),
                  const SizedBox(height: 24),
                  ButtonSection(),
                  const SizedBox(height: 28),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}








