import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text.dart';

class AppTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final bool isPassword;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? prefixText;
  final int? maxLines;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isRequired;
  final TextInputType? keyboardType;
  final BoxConstraints? suffixIconConstraints;
  final bool? readOnly;
  final int? maxLength;
  final Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  const AppTextFormField({
    this.maxLength,
    this.isRequired = false,
    super.key,
    this.isPassword = false,
    this.contentPadding,
    this.focusedBorder,
    this.prefixIcon,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.maxLines,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.prefixText,
    this.controller,
    this.initialValue,
    this.validator,
    this.keyboardType,
    this.suffixIconConstraints,
    this.readOnly,
    this.onFieldSubmitted,
    this.onTap,
    this.textInputAction,
    this.focusNode,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      onTap: widget.onTap,
      maxLength: widget.maxLength,
      onFieldSubmitted: widget.onFieldSubmitted,
      readOnly: widget.readOnly ?? false,
      initialValue: widget.initialValue,
      maxLines: widget.maxLines ?? 1,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      controller: widget.controller,
      decoration: InputDecoration(
        counterText: widget.maxLines == 1 ? null : '',
        isDense: true,
        contentPadding:
            widget.contentPadding ?? EdgeInsets.symmetric(horizontal: 20.w),
        focusedBorder:
            widget.focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: context.colors.primary,
                width: 1.width,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
        enabledBorder:
            widget.enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: context.colors.primary,
                width: 1.width,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.width),
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.width),
          borderRadius: BorderRadius.circular(8.r),
        ),
        hintStyle:
            widget.hintStyle ??
            TextStyle(
              fontSize: 14.font,
              fontWeight: FontWeight.w500,
              color: context.colors.grey,
            ),
        hintText: widget.hintText,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  isPasswordHidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility,
                  color: context.colors.grey,
                ),
                onPressed: () {
                  isPasswordHidden = !isPasswordHidden;
                  setState(() {});
                },
              )
            : SizedBox(child: widget.suffixIcon),
        suffixIconConstraints: widget.suffixIconConstraints,
        prefixIcon:
            widget.prefixIcon ??
            (widget.prefixText == null
                ? null
                : Padding(
                    padding: EdgeInsetsDirectional.only(start: 16.w, end: 2.w),
                    child: AppText(
                      title: widget.prefixText ?? "",
                      fontSize: 14.font,
                      color: context.colors.grey,
                    ),
                  )),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        fillColor: Colors.transparent,
        filled: true,
      ),
      obscureText: widget.isPassword && isPasswordHidden,
      style:
          widget.inputTextStyle ??
          TextStyle(fontSize: 13.font, fontWeight: FontWeight.w500),
      validator: widget.validator,
    );
  }
}
