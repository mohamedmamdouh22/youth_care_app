import 'package:checkmark/checkmark.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youth_care/constants.dart';
import 'package:youth_care/logic/news/news_cubit.dart';
import 'package:youth_care/presentation/widgets/news_card.dart';
import './widgets/widgets.dart';

class AddNews extends StatelessWidget {
  const AddNews({super.key});
  static String id = 'addnew screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddNewsAppBar(),
      body: BlocProvider<NewsCubit>(
        create: (context) => NewsCubit(),
        child: Stack(children: [
          AddNewsBody(),
          ScreenOverlay(),
        ]),
      ),
    );
  }
}

class ScreenOverlay extends StatelessWidget {
  ScreenOverlay({
    super.key,
  });

  bool isLoading = false;
  bool isScuccesful = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        print('informed from the overlay');
        if (state is Publishing) {
          isLoading = true;
        } else {
          isLoading = false;
        }
        if (state is PublishedSuccessfully) {
          isScuccesful = true;
        }
        return Container(
          color: isLoading
              ? Color.fromARGB(146, 131, 131, 131)
              : isScuccesful
                  ? Color.fromARGB(186, 110, 110, 110)
                  : null,
          child: Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : isScuccesful
                      ? Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 60,
                        )
                      : null),
        );
      },
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
                AddNewsFormField(
                  hintText: 'Title',
                  height: 100,
                  fontSize: 30,
                  onChanged: (n) {
                    context.read<NewsCubit>().titleChanged(n);
                  },
                ),
                SizedBox(height: SCREEN_PADDING),
                // News description
                AddNewsFormField(
                  hintText: 'Description',
                  height: 300,
                  fontSize: 25,
                  onChanged: (n) {
                    context.read<NewsCubit>().descriptionChanged(n);
                  },
                ),
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
