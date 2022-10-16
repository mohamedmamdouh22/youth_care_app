import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class AddNewsUploadImageSegment extends StatelessWidget {
  const AddNewsUploadImageSegment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SCREEN_PADDING),
      child: DottedBorder(
        color: Colors.grey,
        // strokeWidth: 3,
        // dashPattern: [0.2, 1],
        radius: Radius.circular(BORDER_RADIUS),
        borderType: BorderType.RRect,
        child: Container(
          width: double.infinity,
          height: 100,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(BORDER_RADIUS),
              child: Material(
                color: primaryColor,
                child: InkWell(
                  onTap: () async {
                    final result = await FilePicker.platform.pickFiles();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'upload image',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
