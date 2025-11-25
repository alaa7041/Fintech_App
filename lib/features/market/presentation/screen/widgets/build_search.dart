
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/app_colors_extension.dart';
import '../../../../../generated/assets.dart';

class BuildSearch extends StatefulWidget {
  BuildSearch({super.key, required this.colors,
    this.search = '',

  });

  final  AppColorsExtension colors ;
  String search ;

  @override
  State<BuildSearch> createState() => _BuildSearchState();
}

class _BuildSearchState extends State<BuildSearch> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(color: widget.colors.secondaryTextColor),
        prefixIcon: SvgPicture.asset(
          Assets.iconsSearchNormal,
          fit: BoxFit.scaleDown,
        ),
        suffixIcon: SvgPicture.asset(Assets.iconsFilter, fit: BoxFit.scaleDown),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: widget.colors.btnTextColor,
      ),
      onChanged: (value) => setState(() => widget.search = value),
    );
  }
}
