import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olearis_test_task/config/navigation/app_router.gr.dart';
import 'package:olearis_test_task/config/resources/app_strings.dart';
import 'package:olearis_test_task/features/login/cubit/login_view/login_view_cubit.dart';
import 'package:olearis_test_task/features/login/cubit/login_view/login_view_state.dart';
import 'package:olearis_test_task/features/shared/app_button.dart';
import 'package:olearis_test_task/features/shared/app_logo.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  LoginView({super.key});

  final screenCubit = LoginViewCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          AppStrings.signIn,
        ),
      ),
      body: BlocBuilder<LoginViewCubit, LoginViewState>(
        bloc: screenCubit,
        builder: (BuildContext context, LoginViewState state) {
          return _buildBody(state);
        },
      ),
    );
  }

  Widget _buildBody(LoginViewState state) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    spacing: 10,
                    children: [
                      const Spacer(),
                      const AppLogo(),
                      const Spacer(),
                      TextField(
                        decoration: const InputDecoration(
                          label: Text(AppStrings.login),
                        ),
                        onChanged: screenCubit.updateEmail,
                      ),
                      TextField(
                          decoration: const InputDecoration(
                            label: Text(AppStrings.password),
                          ),
                          onChanged: screenCubit.updatePassword),
                      const Spacer(flex: 3),
                      AppButton(
                        isEnabled: state.isValid,
                        isLoading: state.isLoading,
                        title: AppStrings.continueString,
                        onTap: () async {
                          await screenCubit.onContinueButtonTap();
                          if (context.mounted) {
                            AutoRouter.of(context).push(const HomeRoute());
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
