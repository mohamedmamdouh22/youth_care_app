import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youth_care/constants.dart';
import 'package:youth_care/data/models/news_model.dart';

class NewsCard extends StatelessWidget {
  NewsCard({required this.news});
  NewsModel news;
  @override
  Widget build(BuildContext context) {
     Size size=MediaQuery.of(context).size;
    return  Padding(
      padding: EdgeInsets.all(size.width/30),
      child: GestureDetector(
        onTap:() {
        print(news.title);
        }, 
        child: Card(
            child: Column(
              children: [
                
                Text(
                  news.title,
                  style:TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  )
                ),
                Text(news.time),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.network(news.image),
                ),
              ],
            ),
          
        ),
      ),
    );
  }
}
