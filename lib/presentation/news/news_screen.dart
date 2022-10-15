import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youth_care/presentation/widgets/divider.dart';
import 'package:youth_care/presentation/widgets/news_card.dart';

class NewsScreen extends StatelessWidget {
   NewsScreen({super.key});
   static String id='news_screen';
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        centerTitle: true,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => CustomDivider(),
        itemBuilder:(context, index) => NewsCard(),
        itemCount: 10,
        ),
    );
  }
}