import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/helpers/utils.dart';
import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExchangeWidget extends StatelessWidget {
  const ExchangeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsExtension>()!;
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 100.height,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.radius),
              color: colors.btnTextColor,
            ),
            child: Row(
              children: [
                Container(
                  height: 50.height,
                  width: 50.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.radius),
                    color: colors.orange,
                  ),
                  child: SvgPicture.asset(
                    Utils.getImagesSVGPath("dollar_circle"),
                  ),
                ),
                SizedBox(width: 16.width),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title: "Exchange fee",
                      fontSize: 12,
                      fontWeight: FontWeightsHelper.medium,
                      color: colors.grey,
                    ),
                    AppText(
                      title: "0.05%",
                      fontSize: 16,
                      fontWeight: FontWeightsHelper.semiBold,
                      color: colors.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 16.width),
        Container(
          height: 100.height,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.radius),
            color: colors.btnTextColor,
          ),
          child: Center(
            child: AppText(
              title: "0.05%",
              fontSize: 16,
              fontWeight: FontWeightsHelper.semiBold,
              color: colors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
