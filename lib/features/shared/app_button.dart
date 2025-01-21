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
      color: isEnabled ? AppColors.blue : AppColors.grey,
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        onTap: isEnabled ? onTap : null,
        child: Container(
          height: 35,
          width: 100,
          alignment: Alignment.center,
          child: _content(context),
        ),
      ),
    );
  }

  Widget _content(BuildContext context) {
    return isLoading
        ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color: AppColors.white,
              strokeWidth: 2,
            ),
          )
        : Text(
            title,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: AppColors.white),
          );
  }
}
