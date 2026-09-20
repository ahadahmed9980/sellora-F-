import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sellora/utils/theme/app_theme.dart';

class DynamicTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String hintText;
  final IconData? prefixIcon;
  final Widget? prefixWidget;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final VoidCallback? onSuffixTap;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final bool enabled;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final int? maxLength;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;

  const DynamicTextFormField({
    super.key,
    this.controller,
    this.labelText,
    required this.hintText,
    this.prefixIcon,
    this.prefixWidget,
    this.suffixIcon,
    this.suffixWidget,
    this.onSuffixTap,
    this.isPassword = false,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.inputFormatters,
    this.readOnly = false,
    this.enabled = true,
    this.focusNode,
    this.autovalidateMode,
    this.maxLength,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
  });

  @override
  State<DynamicTextFormField> createState() => _DynamicTextFormFieldState();
}

class _DynamicTextFormFieldState extends State<DynamicTextFormField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    final theme = AppTextFieldTheme.inputDecorationTheme;

    Widget? buildPrefix() {
      if (widget.prefixWidget != null) {
        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [widget.prefixWidget!],
          ),
        );
      }
      if (widget.prefixIcon != null) {
        return Icon(
          widget.prefixIcon,
          color: theme.prefixIconColor ?? AppColors.textMuted,
          size: AppTheme.iconRegular,
        );
      }
      return null;
    }

    Widget? buildSuffix() {
      if (widget.isPassword) {
        return IconButton(
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
        );
      }
      if (widget.suffixWidget != null) {
        return widget.suffixWidget;
      }
      if (widget.suffixIcon != null) {
        return widget.onSuffixTap != null
            ? IconButton(
                icon: Icon(
                  widget.suffixIcon,
                  color: theme.suffixIconColor ?? AppColors.textMuted,
                  size: AppTheme.iconRegular,
                ),
                onPressed: widget.onSuffixTap,
              )
            : Icon(
                widget.suffixIcon,
                color: theme.suffixIconColor ?? AppColors.textMuted,
                size: AppTheme.iconRegular,
              );
      }
      return null;
    }

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
          inputFormatters: widget.inputFormatters,
          readOnly: widget.readOnly,
          enabled: widget.enabled,
          focusNode: widget.focusNode,
          autovalidateMode: widget.autovalidateMode,
          maxLength: widget.maxLength,
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
            prefixIcon: buildPrefix(),
            prefixIconConstraints: widget.prefixIconConstraints ??
                (widget.prefixWidget != null
                    ? const BoxConstraints(minWidth: 0, minHeight: 0)
                    : null),
            suffixIcon: buildSuffix(),
            suffixIconConstraints: widget.suffixIconConstraints,
          ),
        ),
        const SizedBox(height: AppTheme.spacingSM),
      ],
    );
  }
}
