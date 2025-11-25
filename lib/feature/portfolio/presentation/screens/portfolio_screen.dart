import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/core/widgets/custom_app_bar.dart';
import 'package:fintech_app/core/widgets/month_selector.dart';
import 'package:fintech_app/core/widgets/portfolio_card.dart';
import 'package:fintech_app/feature/portfolio/widgets/holding_item.dart';
import 'package:fintech_app/feature/portfolio/widgets/portfolio_chart_widget.dart';
import 'package:fintech_app/feature/portfolio/widgets/total_value_card.dart';
import 'package:fintech_app/feature/portfolio/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  int selectedMonthIndex = 1; // Default to Dec

  final List<String> months = ['Nov', 'Dec', 'Jan', 'Feb', 'Mar', 'Apr'];

  // Mock data - in real app, this would come from a repository/API
  final double totalValue = 143421.20;
  final double changePercentage = 2.5;
  final double changeAmount = 305.20;

  @override
  Widget build(BuildContext context) {
    final colors = context.theme;

    // Initialize assets with theme colors
    final portfolioAssets = [
      PortfolioAsset(
        symbol: 'BTC',
        name: 'Bitcoin',
        percentage: 50,
        value: 54382.64,
        color: colors.cryptoBTC,
      ),
      PortfolioAsset(
        symbol: 'ETH',
        name: 'Ethereum',
        percentage: 30,
        value: 4145.61,
        color: colors.cryptoETH,
      ),
      PortfolioAsset(
        symbol: 'LTC',
        name: 'Litecoin',
        percentage: 20,
        value: 64.20,
        color: colors.cryptoLTC,
      ),
    ];

    return Scaffold(
      backgroundColor: colors.bgColor,
      appBar: const CustomAppBar(title: 'Portfolio'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Value Card
            TotalValueCard(
              totalValue: totalValue,
              changePercentage: changePercentage,
              changeAmount: changeAmount,
            ),
            const SizedBox(height: 24),

            // Month Selector
            MonthSelector(
              months: months,
              selectedIndex: selectedMonthIndex,
              onMonthSelected: (index) {
                setState(() {
                  selectedMonthIndex = index;
                });
              },
            ),
            const SizedBox(height: 24),

            // Portfolio Chart
            PortfolioCard(
              child: PortfolioChartWidget(
                totalValue: totalValue,
                assets: portfolioAssets,
              ),
            ),
            const SizedBox(height: 24),

            // My Holdings Section
            Text(
              'My Holdings',
              style: TextStyle(
                color: colors.primaryTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),

            // Holdings List
            HoldingItem(
              symbol: 'BTC',
              name: 'Bitcoin',
              amount: 0.05,
              valueUSD: 2262.53,
              portfolioPercentage: 50,
              profitLossAmount: 145.20,
              profitLossPercentage: 6.85,
              iconColor: colors.cryptoBTC,
            ),
            HoldingItem(
              symbol: 'ETH',
              name: 'Ethereum',
              amount: 1.5,
              valueUSD: 3130.75,
              portfolioPercentage: 30,
              profitLossAmount: 56.70,
              profitLossPercentage: 1.83,
              iconColor: colors.cryptoETH,
            ),
            HoldingItem(
              symbol: 'LTC',
              name: 'Litecoin',
              amount: 26.3,
              valueUSD: 2503.76,
              portfolioPercentage: 20,
              profitLossAmount: 120.80,
              profitLossPercentage: 5.07,
              iconColor: colors.cryptoLTC,
            ),
            const SizedBox(height: 24),

            // Recent Transactions Section
            Text(
              'Recent Transactions',
              style: TextStyle(
                color: colors.primaryTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),

            // Transactions List
            const TransactionItem(
              type: TransactionType.buy,
              cryptoName: 'Bitcoin',
              timestamp: '2 hours ago',
              amount: 0.01,
              symbol: 'BTC',
              valueUSD: 452.30,
            ),
            const TransactionItem(
              type: TransactionType.sell,
              cryptoName: 'Ethereum',
              timestamp: '1 day ago',
              amount: 0.5,
              symbol: 'ETH',
              valueUSD: 1050.25,
            ),
          ],
        ),
      ),
    );
  }
}
