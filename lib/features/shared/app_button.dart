import 'package:flutter/material.dart';
import 'package:olearis_test_task/config/resources/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onTap,
    required this.title,
    this.isEnabled = true,
    this.isLoading = false,
  });

  final String title;
  final bool isEnabled;
  final bool isLoading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.blue,
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        onTap: isEnabled ? onTap : null,
        child: SizedBox(
          height: 35,
          child: _content(context),
        ),
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Center(
        widthFactor: 1,
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppColors.white),
              ),
      ),
    );
  }
}
