import 'package:fintech_app/core/helpers/utils.dart';
import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/core/widgets/switch_theme_button.dart';
import 'package:fintech_app/feature/setting/presentation/widgets/custom_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSettings extends StatefulWidget {
  const CustomSettings({super.key});

  @override
  State<CustomSettings> createState() => _CustomSettingsState();
}

class _CustomSettingsState extends State<CustomSettings> {
  bool isDark = true;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsExtension>()!;
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Settings',
            style: TextStyle(
              fontWeight: FontWeightsHelper.semiBold,
              fontSize: 16,
              color: colors.primary,
            ),
          ),
        ),
        SizedBox(height: 20),
        CustomItem(
          image: Utils.getImagesSVGPath('Discovery'),
          text: 'Language',
          icon: Icons.arrow_forward_ios,
          onTap: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 20),
          child: Divider(height: 1, color: colors.grey),
        ),
        Row(
          children: [
            Container(
              height: 32,
              width: 32,
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: colors.primary,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(Utils.getImagesSVGPath('moon')),
            ),
            SizedBox(width: 15),
            Text(
              'Dark Mode',
              style: TextStyle(
                fontWeight: FontWeightsHelper.semiBold,
                fontSize: 16,
                color: colors.primary,
              ),
            ),
            Spacer(),

            SwitchThemeToggle(),
          ],
        ),
      ],
    );
  }
}
