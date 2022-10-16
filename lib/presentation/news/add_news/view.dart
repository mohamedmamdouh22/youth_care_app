import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:youth_care/constants.dart';
import './widgets/widgets.dart';

class AddNews extends StatelessWidget {
  const AddNews({super.key});
  static String id = 'addnew screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddNewsAppBar(),
      body: AddNewsBody(),
    );
  }
}

class AddNewsBody extends StatelessWidget {
  const AddNewsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          Form(
            child: Column(
              children: [
                SizedBox(height: SCREEN_PADDING),
                // News Title
                AddNewsFormField(height: 100),
                SizedBox(height: SCREEN_PADDING),
                // News description
                AddNewsFormField(height: 300),
                SizedBox(height: SCREEN_PADDING),

                AddNewsUploadImageSegment(),
                SizedBox(height: SCREEN_PADDING),
                AddNewsPublishButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
