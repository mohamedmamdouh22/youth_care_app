import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youth_care/constants.dart';

class NewsCard extends StatelessWidget {
  NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'title',
            style:TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            )
          ),
          Text('22-3-2001 23:00'),
          Image.asset(shoubra),
        ],
      ),
    );
  }
}
