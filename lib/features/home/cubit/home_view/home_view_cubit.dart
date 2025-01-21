import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olearis_test_task/features/home/cubit/home_view/home_view_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit() : super(const HomeViewState());

  void addItem() {
    state.gridItems.add('Item ${state.gridItems.length}');
    emit(state.copyWith(gridItems: state.gridItems));
  }

  void removeLastItem() {
    if (state.gridItems.isNotEmpty) {
      state.gridItems.removeLast();
      emit(state.copyWith(gridItems: state.gridItems));
    }
  }
}
