import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
           final colors = Theme.of(context).extension<AppColorsExtension>()!; 
    return Column(
      children: [
        Image.asset('assets/images/Ellipse 125.png'),
            SizedBox(height: 20,),
            Text(
              'Sophia Isabella',
               style: TextStyle(
              fontWeight: FontWeightsHelper.bold,
            fontSize: 20,
            color: colors.primary,
                      ),
                      ),
      ],
    );
  }
}