import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final Function(String? val) validator;
  final Function(String? val) change;
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? iconDelete;
  final bool? autoFoucs;
  final Function()? onTap;
  final int maxLine;
  final TextInputType ?keyboardType;
  final bool ? readOnly ;

  const TextFieldWidget({
    Key? key,
    required this.validator,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.iconDelete,
    required this.change,
    this.autoFoucs,
    this.onTap,
    this.maxLine = 1,
    this.keyboardType,
    this.readOnly

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) => validator(val),
      onChanged: (val) => change(val),
      controller: controller,
      obscureText: obscureText,
      readOnly: readOnly ?? false,
      keyboardType: keyboardType,
      onTap: () => onTap,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      autofocus: autoFoucs ?? false,
      maxLines: maxLine,
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.withOpacity(0.2),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          suffix: iconDelete,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.green,
            fontFamily: 'NotoKufiArabic',
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red.withOpacity(0.1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          )),
    );
  }
}
