import 'package:flutter/material.dart';
import 'app_colors.dart';

class ForgetPasswordRow extends StatelessWidget {
  final String? firstWhiteText;
  final String? secoednBlcakText;
  final VoidCallback? onTap; // <-- add tap callback
  const ForgetPasswordRow({
    super.key,
    this.firstWhiteText,
    this.secoednBlcakText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstWhiteText ?? ' ',
          style: TextStyle(
            color: AppColors.whiteApp,
            fontSize: 18,
            fontWeight: FontWeight.w200,
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onTap, // <-- call callback here
          child: Text(
            secoednBlcakText ?? '',
            style: TextStyle(
              color: AppColors.whiteBloc,
              fontSize: 18,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ],
    );
  }
}
