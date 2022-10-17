import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youth_care/constants.dart';
import 'package:youth_care/data/models/news_model.dart';
import 'package:youth_care/presentation/widgets/divider.dart';

class NewsDetails extends StatelessWidget {
  NewsDetails({required this.news});
  static String id = 'addnew screen';
  NewsModel news;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // NewsModel news=ModalRoute.of(context)!.settings.arguments as NewsModel;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:Icon(Icons.arrow_back_ios,
          color: primaryColor,
        )),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: size.width/30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.network(
              news.image,
              width: size.width,
              fit: BoxFit.contain,
            ),
            SizedBox(height: size.height/40),
            Text(
              news.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
            ),
            Text(news.time,style: TextStyle(fontSize: 18,color: Colors.grey),),
           CustomDivider(),
           SizedBox(height: size.height/40),
            Text(
              textAlign: TextAlign.end,
              news.des,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20
              ),
            )
          ],
        ),
      ),
    );
  }
}
