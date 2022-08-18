import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController ? controller,
  required TextInputType? type,
  ValueChanged ?onSubmit,
  ValueChanged ?onChange,
  GestureTapCallback ?onTap,
  bool isPassword = false,
  required FormFieldValidator ?validate,
  required String ?label,
  required IconData ?prefix,
  IconData ?suffix,
  GestureTapCallback ?suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: OutlineInputBorder(),
      ),
    );