import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/helpers/utils.dart';
import 'package:fintech_app/core/routing/route_manager.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/core/widgets/app_bg_layout.dart';
import 'package:fintech_app/core/widgets/app_success_dialog.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:fintech_app/feature/auth/login/presentation/manager/login_cubit.dart';
import 'package:fintech_app/feature/nav_bar/presentation/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class FingrprintScreen extends StatelessWidget {
  const FingrprintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: AppBackgroundLayout(
          child: Padding(
            padding: Utils.viewPadding,
            child: BlocBuilder<LoginCubit, LoginState>(
            

              builder: (context, state) {
                final cubit = LoginCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(90),
                    AppText(
                      title: "Touch ID sensor to verify yourself",
                      style: TextStyle(
                        fontSize: 26.font,
                        fontWeight: FontWeightsHelper.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Gap(130),
                    GestureDetector(
                      onTap: state is! BiometricLoading
                          ? () => cubit.authenticateFingerprint(context)
                          : null,
                      child: Container(
                        padding: EdgeInsets.all(24.width),
                        decoration: BoxDecoration(
                          color: state is BiometricLoading
                              ? Colors.grey.withOpacity(0.3)
                              : Colors.blue.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          Utils.getImagesSVGPath("fingrprint"),
                          height: 124.height,
                          width: 124.width,
                          colorFilter: state is BiometricLoading
                              ? ColorFilter.mode(Colors.grey, BlendMode.srcIn)
                              : null,
                        ),
                      ),
                    ),

                    Gap(210),
                    AppText(
                      title:
                          "Please verify your identity using touch ID and it will proceed automatically.",
                      style: TextStyle(
                        fontSize: 18.font,
                        fontWeight: FontWeightsHelper.regular,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
