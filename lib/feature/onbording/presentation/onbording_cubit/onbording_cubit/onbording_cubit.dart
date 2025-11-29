import 'package:fintech_app/feature/onbording/data/models/onboarding_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  void changePage(int index) => emit(index);

  final List<OnboardingPageModel> pages = const [
    OnboardingPageModel(title: "Welcome to Crypto X!", image: "onboarding1"),
    OnboardingPageModel(title: "Easy to Use", image: "onboarding2"),
    OnboardingPageModel(title: "Your Privacy Matters", image: "onboarding3"),
  ];
}
