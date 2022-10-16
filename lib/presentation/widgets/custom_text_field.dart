

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(
      {Key? key, required this.hint, this.onChanged, this.icon,this.obscureText = false})
      : super(key: key);
  String? hint;
  bool obscureText;
  Function(String)? onChanged;
  IconButton ?icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 7,
      ),
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return 'field is required';
          }
        },
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Color(0xff3f5061),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color:  Color(0xff3f5061),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color:  Color(0xff3f5061),
            ),
          ),
          suffixIcon: icon,

          hintText: hint,
          hintStyle: TextStyle(
            color: Color(0xff3f5061),
          ),
        ),
      ),
    );
  }
}
