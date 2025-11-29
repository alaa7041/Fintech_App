
import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomItem extends StatelessWidget {
   CustomItem({super.key, required this.image, required this.text, required this.icon,required this.onTap});

  final String image, text;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
   final colors = Theme.of(context).extension<AppColorsExtension>()!; 
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 32,
            width: 32,
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: colors.primary,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
                image,
                       ),
          ),
          SizedBox(width: 15,),
          Text(
             text, style: TextStyle(
           fontWeight: FontWeightsHelper.semiBold,
            fontSize: 16,   
             color: colors.primary,
                 ),
                 ),
          Spacer(),
         Icon(icon, color: colors.primary,)
        ],
      ),
    );
  }
}