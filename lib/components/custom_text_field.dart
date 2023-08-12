import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.maxLines,
    this.onTap,
    this.prefixIcon,
    this.focusnode,
  }) : super(key: key);
  final String? hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final void Function()? onTap;
  final Widget? prefixIcon;
  final FocusNode? focusnode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      onTap: onTap,
      focusNode: focusnode,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          border: const OutlineInputBorder(),
          filled: true,
          hintText: hintText),
    );
  }
}
