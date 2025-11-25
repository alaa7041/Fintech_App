import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/helpers/utils.dart';
import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:fintech_app/core/theming/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../manager/nav_bar_cubit.dart';
part 'utils/nav_icon.dart';

class NavBar extends StatelessWidget {
  final int initialViewIndex;

  const NavBar({super.key, this.initialViewIndex = 0});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(currentViewIndex: initialViewIndex),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          final cubit = NavBarCubit.of(context);
          final List<BottomNavigationBarItem> items = [
            BottomNavigationBarItem(
              icon: _NavIcon(
                assetPath: "home",
                index: 0,
                selectedIndex: cubit.currentViewIndex,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _NavIcon(
                assetPath: "chart",
                index: 1,
                selectedIndex: cubit.currentViewIndex,
              ),
              label: 'Market',
            ),
            BottomNavigationBarItem(
              icon: _NavIcon(
                assetPath: "prof",
                index: 2,
                selectedIndex: cubit.currentViewIndex,
              ),
              label: 'Portfolio',
            ),
            BottomNavigationBarItem(
              icon: _NavIcon(
                assetPath: "setting",
                index: 3,
                selectedIndex: cubit.currentViewIndex,
              ),
              label: 'Settings',
            ),
          ];
          final colors = Theme.of(context).extension<AppColorsExtension>()!;

          return Scaffold(
            body: cubit.screens[cubit.currentViewIndex],
            bottomNavigationBar: BottomNavigationBar(
            
              backgroundColor: colors.btnTextColor,
              currentIndex: cubit.currentViewIndex,
              onTap: (index) => cubit.changeView(index),
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: LightColors.primary,
              unselectedItemColor: LightColors.grey,
              selectedLabelStyle: TextStyle(fontSize: 12.font,fontWeight: FontWeight.w400),
              unselectedLabelStyle: TextStyle(fontSize: 12.font,fontWeight: FontWeight.w400),
              items: items,
            ),
          );
        },
      ),
    );
  }
}
