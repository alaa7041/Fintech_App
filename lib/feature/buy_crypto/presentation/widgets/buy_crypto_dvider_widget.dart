import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:flutter/material.dart';

class BuyCryptoDviderWidget extends StatelessWidget {
  const BuyCryptoDviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsExtension>()!;
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 10),
            height: 1,
            color:colors .grey,
          ),
        ),
        Icon(
          Icons.swap_vert,
          color: colors.orange,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            height: 1,
            color: colors.grey,
          ),
        ),
      ],
    );
  }
}
