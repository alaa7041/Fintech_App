import 'package:fintech_app/feature/onbording/presentation/onbording_cubit/onbording_cubit/onbording_cubit.dart';
import 'package:fintech_app/feature/onbording/presentation/widget/onboarding_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => OnboardingCubit(),
        child: const OnboardingScreenBody(),
      ),
    );
  }
}
