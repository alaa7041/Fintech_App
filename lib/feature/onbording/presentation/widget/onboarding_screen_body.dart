import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/helpers/app_media.dart';
import 'package:fintech_app/feature/onbording/presentation/widget/onboarding_dots_indicator_widget.dart';
import 'package:fintech_app/feature/onbording/presentation/widget/onboarding_navigation_button_widget.dart';
import 'package:fintech_app/feature/onbording/presentation/widget/onboarding_page_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../onbording_cubit/onbording_cubit/onbording_cubit.dart';

class OnboardingScreenBody extends StatefulWidget {
  const OnboardingScreenBody({super.key});

  @override
  State<OnboardingScreenBody> createState() => _OnboardingScreenBodyState();
}

class _OnboardingScreenBodyState extends State<OnboardingScreenBody>
    with TickerProviderStateMixin {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, int>(
      builder: (context, currentIndex) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.width),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: OnboardingPageViewWidget(
                  pageController: _pageController,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OnboardingDotsIndicatorWidget(currentIndex: currentIndex),
                  Spacer(),
                  OnboardingNavigationButtonWidget(
                    currentIndex: currentIndex,
                    pageController: _pageController,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
              SizedBox(height: context.height / 7),
            ],
          ),
        );
      },
    );
  }
}
