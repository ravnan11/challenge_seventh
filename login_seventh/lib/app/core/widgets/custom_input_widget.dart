// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {
  final bool obscure;
  final Widget? suffixIcon;
  final String? hint;
  final Widget? icon;
  TextInputType? keyboardType;
  final FocusNode? focus;
  final FocusNode? requestFocus;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final String? initialValue;
  final String? textLabel;

  CustomInputWidget({
    Key? key,
    this.obscure = false,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
    this.icon,
    this.controller,
    this.onSubmitted,
    this.focus,
    this.requestFocus,
    this.hint,
    this.initialValue,
    this.textLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(),
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              keyboardType: keyboardType,
              initialValue: initialValue,
              obscureText: obscure,
              focusNode: focus,
              validator: validator,
              onChanged: onChanged,
              onFieldSubmitted: (term) async {
                if (requestFocus != null) {
                  FocusScope.of(context).requestFocus(requestFocus);
                }
                if (onSubmitted != null) {
                  onSubmitted!;
                }
              },
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                isDense: true,
                labelText: textLabel,
                hintText: hint,
                suffixIcon: suffixIcon,
                icon: icon,
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                errorMaxLines: 1,
                filled: true,
                errorStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 10,
                  fontFamily: 'Roboto',
                ),
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                ),
                border: OutlineInputBorder(borderSide: BorderSide()),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
