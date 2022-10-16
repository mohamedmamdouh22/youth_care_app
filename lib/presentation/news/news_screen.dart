import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youth_care/constants.dart';
import 'package:youth_care/data/models/news_model.dart';
import 'package:youth_care/logic/news/news_cubit.dart';
import 'package:youth_care/presentation/news/add_news.dart';
import 'package:youth_care/presentation/widgets/divider.dart';
import 'package:youth_care/presentation/widgets/news_card.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});
  static String id = 'news_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AddNews.id);
            },
            icon: Icon(Icons.add),
          )
        ],
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        
        builder: (context, state) {
          List<NewsModel> newslist=BlocProvider.of<NewsCubit>(context).newsList;
          return ListView.separated(
              separatorBuilder: (context, index) => CustomDivider(),
              itemCount: newslist.length,
              itemBuilder: (BuildContext context, int index) {
                return NewsCard(news: newslist[index]);
              });
        },
      ),
    );
  }
}
