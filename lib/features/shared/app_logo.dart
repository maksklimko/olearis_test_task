import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:olearis_test_task/config/assets/assets.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.isBorderShowed = false});
  final bool isBorderShowed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isBorderShowed
          ? BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
            )
          : null,
      child: Padding(
        padding: isBorderShowed ? const EdgeInsets.all(10) : EdgeInsets.zero,
        child: SvgPicture.asset(
          Assets.ASSETS_SVG_LOGO_SVG,
          width: double.infinity,
          height: 100,
        ),
      ),
    );
  }
}
