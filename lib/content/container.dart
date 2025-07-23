import 'package:app1/content/app_colors.dart';
import 'package:flutter/material.dart';

class ContainerScreen extends StatelessWidget {
  final Widget child;

  const ContainerScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
        height: screenHeight * 2 / 3,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: child);
  }
}
