import 'package:flutter/material.dart';
import 'package:sellora/utils/theme/app_theme.dart';

class DynamicTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  const DynamicTextFormField({
    super.key,
    this.controller,
    this.labelText,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.isPassword = false,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
  });

  @override
  State<DynamicTextFormField> createState() => _DynamicTextFormFieldState();
}

class _DynamicTextFormFieldState extends State<DynamicTextFormField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    final theme = AppTextFieldTheme.inputDecorationTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.labelText != null && widget.labelText!.isNotEmpty) ...[
          Text(
            widget.labelText!,
            style: AppTypography.h3.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppTheme.spacingSM),
        ],
        TextFormField(
          controller: widget.controller,
          obscuringCharacter: "*",
          obscureText: widget.isPassword ? _isObscured : false,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          validator: widget.validator,
          onChanged: widget.onChanged,
          cursorColor: AppColors.primary,
          cursorHeight: 18,
          style: AppTypography.bodyLarge.copyWith(color: AppColors.textPrimary),
          decoration: InputDecoration(
            isDense: theme.isDense,
            hintText: widget.hintText,
            hintStyle: theme.hintStyle,
            errorStyle: theme.errorStyle,
            filled: theme.filled,
            fillColor: theme.fillColor,
            contentPadding: theme.contentPadding,
            border: theme.border,
            enabledBorder: theme.enabledBorder,
            focusedBorder: theme.focusedBorder,
            errorBorder: theme.errorBorder,
            focusedErrorBorder: theme.focusedErrorBorder,
            disabledBorder: theme.disabledBorder,
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    color: theme.prefixIconColor ?? AppColors.textMuted,
                    size: AppTheme.iconRegular,
                  )
                : null,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _isObscured
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: theme.suffixIconColor ?? AppColors.textMuted,
                      size: AppTheme.iconRegular,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  )
                : (widget.suffixIcon != null
                      ? IconButton(
                          icon: Icon(
                            widget.suffixIcon,
                            color: theme.suffixIconColor ?? AppColors.textMuted,
                            size: AppTheme.iconRegular,
                          ),
                          onPressed: widget.onSuffixTap,
                        )
                      : null),
          ),
        ),
        const SizedBox(height: AppTheme.spacingSM),
      ],
    );
  }
}
