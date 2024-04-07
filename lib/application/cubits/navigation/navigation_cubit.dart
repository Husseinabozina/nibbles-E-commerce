import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_state.dart';

// Cubit
class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitialState());
  int currentIndex = 0;
  void navigateToPage(int pageIndex) {
    currentIndex = pageIndex;

    emit(NavigationPageChangedState(pageIndex));
  }
}
