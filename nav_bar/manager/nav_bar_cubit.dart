import 'package:bloc/bloc.dart';
import 'package:fintech_app/feature/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit({required this.currentViewIndex}) : super(NavBarInitial());

  static NavBarCubit of(context) => BlocProvider.of(context);

  int currentViewIndex = 0;

  List<Widget> screens = [HomeScreen(), Scaffold(), Scaffold(), Scaffold()];

  void changeView(int index) {
    if (currentViewIndex == index) {
      return;
    }
    currentViewIndex = index;
    _emit(NavBarInitial());
  }

  bool get isStateLoading {
    return state is NavBarLoading;
  }

  _emit(NavBarState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
