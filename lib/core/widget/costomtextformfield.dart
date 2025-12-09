import 'package:flutter/material.dart';

class Costomtextformfield extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? textlabel;
  final String hinttext;
  final bool? isCollapsed;
  final bool? filled;
  final IconData prefixicon;
  final Color? colorfill;
  final bool? readOnly;
  final bool? obscureText;
  final TextInputType? typekeybord;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final void Function()? showtext;
  final String? Function(String?)? validator;
  const Costomtextformfield({
    super.key,
    this.controller,
    this.textlabel,
    required this.hinttext,
    this.isCollapsed,
    this.filled,
    required this.prefixicon,
    this.colorfill,
    this.readOnly,
    this.obscureText,
    this.typekeybord,
    this.validator,
    this.focusedBorder,
    this.enabledBorder,
    this.disabledBorder,
    this.showtext,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: textlabel,
        hintText: hinttext,
        isCollapsed: isCollapsed ?? false,
        prefixIcon: InkWell(onTap: showtext, child: Icon(prefixicon)),
        filled: filled ?? true,
        fillColor: colorfill ?? Colors.white,
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.green),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.green.shade200),
            ),
        disabledBorder:
            disabledBorder ??
            OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      keyboardType: typekeybord ?? .text,
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      validator: validator,
    );
  }
}
