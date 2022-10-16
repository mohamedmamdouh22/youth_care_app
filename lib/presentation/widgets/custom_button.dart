
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.text, this.onPressed})
      : super(key: key);
  String? text;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(

      onPressed: onPressed,
      child: Center(

        child: Text(

          '$text',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),

      style: OutlinedButton.styleFrom(
        backgroundColor: Color(0xff3f5061),
        shape: StadiumBorder(),
        side: BorderSide(width: 2,color:Color(0xff3f5061),),
      ),



      );
  }
}
