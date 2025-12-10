import 'package:fintech_app/feature/setting/presentation/widgets/custom_general_listView.dart';
import 'package:fintech_app/feature/setting/presentation/widgets/custom_settings.dart';
import 'package:fintech_app/feature/setting/presentation/widgets/header.dart';
import 'package:flutter/material.dart';

class BodySettingScreen extends StatelessWidget {
  const BodySettingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Header(),
            SizedBox(height: 20,),
           CustomGeneralListview(),
           SizedBox(height: 20,),
             CustomSettings(),
          ],
        ),
      ),
    );
  }
}