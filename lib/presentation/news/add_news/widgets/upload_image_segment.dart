import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youth_care/logic/news/news_cubit.dart';

import '../../../../constants.dart';

class AddNewsUploadImageSegment extends StatefulWidget {
  const AddNewsUploadImageSegment({
    super.key,
  });

  @override
  State<AddNewsUploadImageSegment> createState() =>
      _AddNewsUploadImageSegmentState();
}

class _AddNewsUploadImageSegmentState extends State<AddNewsUploadImageSegment> {
  bool imageSelected = false;
  String? imageName;
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      buildWhen: (previous, current) {
        if (current is ImageSelected) {
          imageSelected = true;
          imageName = current.name;
          imageFile = current.file;
          return true;
        }
        return false;
      },
      builder: (context, state) {
        ImageProvider img = AssetImage('assets/diagonal_lines.jpg');
        if (imageSelected) {
          img = FileImage(imageFile!);
        }
        if (!imageSelected) {
          img = AssetImage('assets/diagonal_lines.jpg');
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: SCREEN_PADDING),
          child: DottedBorder(
            color: Color.fromARGB(169, 0, 0, 0),
            // strokeWidth: 3,
            // dashPattern: [0.2, 1],
            radius: Radius.circular(BORDER_RADIUS),
            borderType: BorderType.RRect,
            child: Container(
              // padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: imageSelected
                    ? Color.fromARGB(146, 0, 0, 0)
                    : Color.fromARGB(90, 158, 158, 158),
                image: DecorationImage(
                  image: img,
                  fit: BoxFit.cover,
                  opacity: imageSelected ? 1 : 0.2,
                ),
              ),
              width: double.infinity,
              height: 100,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(BORDER_RADIUS),
                      child: Material(
                        color: primaryColor,
                        child: InkWell(
                          onTap: () async {
                            context.read<NewsCubit>().selectImage();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'select image',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (imageName != null)
                      Container(
                        color: Color.fromARGB(111, 158, 158, 158),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.green[400],
                            ),
                            SizedBox(width: 5),
                            Text(
                              imageName!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
