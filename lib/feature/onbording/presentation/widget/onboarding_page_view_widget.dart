import 'package:fintech_app/feature/onbording/presentation/onbording_cubit/onbording_cubit/onbording_cubit.dart';
import 'package:fintech_app/feature/onbording/presentation/widget/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPageViewWidget extends StatelessWidget {
  const OnboardingPageViewWidget({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final pages = context.read<OnboardingCubit>().pages;

    return PageView.builder(
      controller: pageController,
      itemCount: pages.length,
      onPageChanged: (index) =>
          context.read<OnboardingCubit>().changePage(index),
      itemBuilder: (context, index) {
        final pageData = pages[index];
        return OnboardingPage(title: pageData.title, image: pageData.image);
      },
      physics: const BouncingScrollPhysics(),
    );
  }
}
