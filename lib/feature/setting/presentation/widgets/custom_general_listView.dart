import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/core/helpers/utils.dart';
import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/feature/setting/data/models/item_data_model.dart';
import 'package:fintech_app/feature/setting/presentation/widgets/custom_item.dart';
import 'package:flutter/material.dart';

class CustomGeneralListview extends StatelessWidget {
   CustomGeneralListview({super.key});



  List<ItemDataModel> data = [
  ItemDataModel(
  image: Utils.getImagesSVGPath('Profile'),
    text: 'My Account', 
    icon: Icons.arrow_forward_ios, 
    onTap: (){},
    ),
     ItemDataModel(
   image: Utils.getImagesSVGPath('Wallet'),
    text: 'Billing/Payment', 
    icon: Icons.arrow_forward_ios, 
    onTap: (){},
    ),
     ItemDataModel(
   image: Utils.getImagesSVGPath('Frame'),
    text: 'FAQ & Support', 
    icon: Icons.arrow_forward_ios, 
    onTap: (){},
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
           final colors = context.theme; 

    return Column(
      children: [
                      Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'General', style: TextStyle(
                fontWeight: FontWeightsHelper.semiBold,
                          fontSize: 16,   
                           color: colors.primary,
                        ),
                        ),
              ),
               SizedBox(height: 20,),
               ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CustomItem(
                image: data[index].image,
                 text: data[index].text,
                  icon: data[index].icon, 
                  onTap: data[index].onTap,
                  
                  );
                },
                itemCount: data.length,
                 separatorBuilder: (context, index) => Padding(
                   padding: const EdgeInsets.only(top: 20, bottom: 20),
                   child: Divider(
                    height: 1,
                    color: colors.grey,
                   ),
                 ),
               ),
      ],
    );
  }
}