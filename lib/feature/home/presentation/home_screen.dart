import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/helpers/utils.dart';
import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:fintech_app/feature/home/data/models/top_gainers_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
part 'utils/home_app_bar.dart';
part 'utils/home_banner.dart';
part 'utils/custom_grid_view.dart';
part 'utils/market_card.dart';
part 'utils/trending_card.dart';
part 'utils/custom_list_view_trending.dart';
part 'utils/top_gainers_item.dart';
part 'utils/custom_list_view_top_gainers.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _HomeAppBar(title: "Hi, Ahmed 👋🏿"),
      body: ListView(
        padding: Utils.viewPadding,
        children: [
          Column(
            children: [
              _HomeBanner(),
              /// TODO: Other home screen widgets would go here "Rana" Task
              _CustomGridView(),
              _CustomListViewTrending(),
              _CustomListViewTopGainers(),
            ],
          ),
        ],
      ),
    );
  }
}
