class HomeViewState {
  final List<String> gridItems;
  const HomeViewState({this.gridItems = const []});

  HomeViewState copyWith({
    List<String>? gridItems,
  }) {
    return HomeViewState(
      gridItems: gridItems ?? this.gridItems,
    );
  }
}
