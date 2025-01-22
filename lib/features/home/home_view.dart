import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olearis_test_task/config/resources/app_strings.dart';
import 'package:olearis_test_task/features/home/cubit/home_view/home_view_cubit.dart';
import 'package:olearis_test_task/features/home/cubit/home_view/home_view_state.dart';
import 'package:olearis_test_task/features/home/widgets/grid_view_item.dart';
import 'package:olearis_test_task/features/shared/app_logo.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  HomeView({super.key});

  final screenCubit = HomeViewCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          AppStrings.markupTest,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () async {
            final result = await screenCubit.logout();
            if (context.mounted && result) {
              AutoRouter.of(context).back();
            }
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: screenCubit.addItem,
          ),
          IconButton(
            icon: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
            onPressed: screenCubit.removeLastItem,
          ),
        ],
      ),
      body: BlocBuilder<HomeViewCubit, HomeViewState>(
        bloc: screenCubit,
        builder: (BuildContext context, HomeViewState state) {
          return _buildBody(state);
        },
      ),
    );
  }

  Widget _buildBody(HomeViewState state) {
    return SafeArea(
      child: LayoutBuilder(builder: (context, constrains) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constrains.maxHeight,
              minWidth: double.infinity,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 40),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 375),
                      child: const AppLogo(
                        isBorderShowed: true,
                      ),
                    ),
                  ),
                  const Spacer(),
                  _gridView(constrains.maxWidth, state.gridItems),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  _gridView(double width, List<String> items) {
    const itemRatio = 4.0;

    final itemWidth = (width - 30) / 2;
    final itemHeight = itemWidth / itemRatio;

    final itemsHeight = itemHeight * ((items.length - 1) ~/ 2 + 1);
    final spacingHeight = ((items.length - 1) ~/ 2) * 10;

    final gridHeight = items.isNotEmpty ? itemsHeight + spacingHeight : 0.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: gridHeight,
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: itemRatio,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: items.map((e) => GridViewItem(text: e)).toList(),
        ),
      ),
    );
  }
}
