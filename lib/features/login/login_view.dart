import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:olearis_test_task/config/assets/assets.dart';
import 'package:olearis_test_task/config/navigation/app_router.gr.dart';
import 'package:olearis_test_task/config/resources/app_strings.dart';
import 'package:olearis_test_task/features/shared/app_button.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          AppStrings.signIn,
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      spacing: 10,
                      children: [
                        const Spacer(),
                        SvgPicture.asset(
                          Assets.ASSETS_SVG_LOGO_SVG,
                          width: double.infinity,
                          height: 100,
                        ),
                        const Spacer(),
                        TextField(
                          decoration: const InputDecoration(
                            label: Text(AppStrings.login),
                          ),
                          controller: TextEditingController(),
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            label: Text(AppStrings.password),
                          ),
                          controller: TextEditingController(),
                        ),
                        const Spacer(flex: 3),
                        AppButton(
                          title: AppStrings.continueString,
                          onTap: () {
                            AutoRouter.of(context).push(const HomeRoute());
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
      ),
    );
  }
}
