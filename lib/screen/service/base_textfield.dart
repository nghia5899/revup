import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum BorderType { NONE, OUTLINE, UNDERLINE, NONE_ROUND }

class BaseTextField extends StatelessWidget {
  const BaseTextField({
    Key? key,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength,
    this.textInputAction,
    this.textInputType,
    this.onChange,
    this.onFieldSubmitted,
    this.fillColor,
    this.borderType,
    this.isHidden,
    this.contentPadding,
    this.textAlign,
    this.textStyle,
    this.inputFormatters,
    this.autovalidateMode,
    this.validator,
    this.enabled,
    this.focusNode,
  }) : super(key: key);

  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int minLines;
  final int maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChange;
  final String? hintText;
  final Color? fillColor;
  final BorderType? borderType;
  final bool? isHidden;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final bool? enabled;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled ?? true,
      onChanged: onChange,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: isHidden ?? false,
      textInputAction: textInputAction,
      maxLength: maxLength,
      focusNode: focusNode,
      keyboardType: textInputType,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      validator: validator,
      style: textStyle ?? Theme.of(context).textTheme.bodyText2,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      minLines: minLines,
      textAlign: textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: _buildInputBorder(color: Colors.transparent),
        errorBorder: _buildInputBorder(color: Theme.of(context).errorColor.withOpacity(0.6)),
        focusedErrorBorder: _buildInputBorder(color: Theme.of(context).errorColor, width: 1),
        enabledBorder: _buildInputBorder(
          color: borderType != BorderType.UNDERLINE ? Colors.grey : Theme.of(context).dividerColor,
        ),
        disabledBorder: _buildInputBorder(color: Theme.of(context).disabledColor),
        focusedBorder: _buildInputBorder(color: Colors.black, width: 1),
        suffixIconConstraints: const BoxConstraints(maxHeight: 32),
      ),
    );
  }

  InputBorder _buildInputBorder({required Color color, double? width, BorderStyle? borderStyle}) {
    switch (borderType) {
      case BorderType.OUTLINE:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: color, width: width ?? 1, style: borderStyle ?? BorderStyle.solid),
        );
      case BorderType.UNDERLINE:
        return UnderlineInputBorder(borderSide: BorderSide(width: width ?? 1, color: color, style: BorderStyle.solid));
      case BorderType.NONE_ROUND:
        return OutlineInputBorder(borderRadius: BorderRadius.circular(8));
      case BorderType.NONE:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: color, width: width ?? 1, style: borderStyle ?? BorderStyle.solid),
        );
    }
  }
}
