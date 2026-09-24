import 'package:flutter/material.dart';
import 'package:sellora/utils/theme/app_theme.dart';

Widget customButton(
  BuildContext context,
  String title,
  VoidCallback ontap,
) {
  return ElevatedButton(
    onPressed: ontap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTypography.button.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: AppTheme.spacingSM),
        const Icon(
          Icons.arrow_forward_rounded,
          color: Colors.white,
          size: 20,
        ),
      ],
    ),
  );
}