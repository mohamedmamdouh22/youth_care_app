import 'package:flutter/material.dart';

import '../../../../constants.dart';

class AddNewsPublishButton extends StatelessWidget {
  const AddNewsPublishButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SCREEN_PADDING),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(BORDER_RADIUS),
        child: Material(
          color: primaryColor,
          child: InkWell(
            onTap: () {},
            onLongPress: () {},
            child: Container(
              // color: primaryColor,
              height: 60,
              child: Center(
                child: Text(
                  'PUBLISH',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              width: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
