import 'package:flutter/material.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      alignment: Alignment.center,
      child: Text(text),
    );
  }
}
