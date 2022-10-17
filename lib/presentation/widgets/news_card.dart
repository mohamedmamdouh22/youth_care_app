import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youth_care/animation_route.dart';
import 'package:youth_care/constants.dart';
import 'package:youth_care/data/models/news_model.dart';

import 'package:youth_care/presentation/news/news_detalis.dart';

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
        // Navigator.pushNamed(context, AddNews.id,arguments: news);
        Navigator.push(context, SlideRight(Page: NewsDetails(news: news,)));
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
