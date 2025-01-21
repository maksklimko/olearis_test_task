import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:olearis_test_task/config/navigation/app_router.gr.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("asdasd"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      body: Center(
        child: ElevatedButton(
            child: Text("next"),
            onPressed: () {
              AutoRouter.of(context).push(HomeRoute());
            }),
      ),
    );
  }
}
