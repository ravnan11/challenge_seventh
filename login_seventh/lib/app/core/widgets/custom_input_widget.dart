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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
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
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                hintText: hint,
                errorMaxLines: 1,
                errorStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 10,
                  fontFamily: 'Roboto',
                ),
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                ),
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                disabledBorder: InputBorder.none,
                filled: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
