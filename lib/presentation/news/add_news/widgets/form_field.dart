import 'package:flutter/material.dart';
import 'package:youth_care/constants.dart';

class AddNewsFormField extends StatelessWidget {
  AddNewsFormField({
    super.key,
    required this.height,
    required this.hintText,
    required this.fontSize,
    required this.onChanged,
  });

  double height;
  String hintText;
  double fontSize;
  Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SCREEN_PADDING),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(BORDER_RADIUS),
        child: Container(
          height: height,
          color: primaryColor.withAlpha(200),
          padding: EdgeInsets.symmetric(horizontal: SCREEN_PADDING),
          child: TextFormField(
            onChanged: onChanged,
            style: TextStyle(
              fontSize: fontSize,
              color: Color.fromARGB(255, 240, 245, 255),
            ),
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 3,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white)
            ),
          ),
        ),
      ),
    );
  }
}
