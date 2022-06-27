import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/top_news_model.dart';
import 'package:news_app/screens/news_details/news_details_page.dart';
import 'package:news_app/services/http_call.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../widgets/news_card_widget.dart';

class TopNewsCard extends StatefulWidget {
  const TopNewsCard({Key? key}) : super(key: key);

  @override
  State<TopNewsCard> createState() => _TopNewsCardState();
}

class _TopNewsCardState extends State<TopNewsCard> {
  late Future<TopNewsModel> _topNewsList;

  @override
  void initState() {
    _topNewsList = HttpService.gettopNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _topNewsList,
        builder: (context, AsyncSnapshot<TopNewsModel> snapshot) {
          if (snapshot.hasData) {
            List<Article> newsCatalog = snapshot.data!.articles;
            return Expanded(
                child: ListView.builder(
                    itemCount: newsCatalog.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => NewsDetails(
                                  detailsAuthor: newsCatalog[index].author!,
                                  detailsContent: newsCatalog[index].content!,
                                  detailsTitle: newsCatalog[index].title!,
                                  detailsdate:
                                      newsCatalog[index].publishedAt.toString(),
                                  detailsImage:
                                      newsCatalog[index].urlToImage!)),
                        ),
                        child: NewsCardWidget(
                            urlText: newsCatalog[index].title!,
                            urlImage: newsCatalog[index].urlToImage!),
                      );
                    }));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
