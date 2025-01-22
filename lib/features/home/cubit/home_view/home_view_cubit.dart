import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olearis_test_task/config/injector/injector.dart';
import 'package:olearis_test_task/core/services/authentication_service.dart';
import 'package:olearis_test_task/features/home/cubit/home_view/home_view_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit() : super(const HomeViewState());

  void addItem() {
    emit(state.copyWith(
      gridItems: [...state.gridItems, 'Item ${state.gridItems.length}'],
    ));
  }

  void removeLastItem() {
    if (state.gridItems.isNotEmpty) {
      state.gridItems.removeLast();
      emit(state.copyWith(gridItems: state.gridItems));
    }
  }

  Future<bool> logout() async {
    final authResponce = await getIt.get<AuthenticationService>().logout();
    return authResponce.isRight();
  }
}
