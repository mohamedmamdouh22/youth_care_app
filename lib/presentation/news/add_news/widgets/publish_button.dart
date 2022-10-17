import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../logic/news/news_cubit.dart';

class AddNewsPublishButton extends StatelessWidget {
  const AddNewsPublishButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool readyToPublish = false;
    return BlocBuilder<NewsCubit, NewsState>(
        // listener: (context, state) {
        //   if (state is ReadyToPublish) {}
        // },
        builder: (c, s) {
      if (s is ReadyToPublish) {
        readyToPublish = true;
      } else {
        readyToPublish = false;
      }
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: SCREEN_PADDING),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(BORDER_RADIUS),
          child: Material(
            color: readyToPublish ? primaryColor : Colors.grey,
            child: InkWell(
              onTap: readyToPublish
                  ? () {
                      context.read<NewsCubit>().publish();
                    }
                  : null,
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
    });
  }
}
