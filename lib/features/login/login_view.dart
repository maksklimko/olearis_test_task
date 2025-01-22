import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olearis_test_task/config/navigation/app_router.gr.dart';
import 'package:olearis_test_task/config/resources/app_strings.dart';
import 'package:olearis_test_task/features/login/cubit/login_view/login_view_cubit.dart';
import 'package:olearis_test_task/features/login/cubit/login_view/login_view_state.dart';
import 'package:olearis_test_task/features/shared/app_button.dart';
import 'package:olearis_test_task/features/shared/app_logo.dart';
import 'package:olearis_test_task/features/shared/app_textfield.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final screenCubit = LoginViewCubit();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                      AppTextfield(
                        label: AppStrings.login,
                        controller: emailController,
                        onChanged: screenCubit.updateEmail,
                      ),
                      AppTextfield(
                        label: AppStrings.password,
                        controller: passwordController,
                        onChanged: screenCubit.updatePassword,
                      ),
                      const Spacer(flex: 3),
                      AppButton(
                        isEnabled: state.isValid,
                        isLoading: state.isLoading,
                        title: AppStrings.continueString,
                        onTap: () async {
                          final result =
                              await screenCubit.onContinueButtonTap();
                          if (context.mounted && result) {
                            AutoRouter.of(context).push(HomeRoute());
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
