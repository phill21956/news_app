import 'package:flutter/material.dart';
import 'package:news_app/models/sport_news_model.dart';

import '../../../services/http_call.dart';
import '../../../widgets/news_card_widget.dart';
import '../../news_details/news_details_page.dart';

class SportNewsList extends StatefulWidget {
  const SportNewsList({Key? key}) : super(key: key);

  @override
  State<SportNewsList> createState() => _SportNewsListState();
}

class _SportNewsListState extends State<SportNewsList> {
  late Future<SportNewsModel> _sportNewsList;

  @override
  void initState() {
    _sportNewsList = HttpService.getsportNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _sportNewsList,
        builder: (context, AsyncSnapshot<SportNewsModel> snapshot) {
          if (snapshot.hasData) {
            List<Article> sportCatalog = snapshot.data!.articles;
            return Expanded(
                child: ListView.builder(
                    itemCount: sportCatalog.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => NewsDetails(
                                  detailsAuthor: sportCatalog[index].author,
                                  detailsContent: sportCatalog[index].content,
                                  detailsTitle: sportCatalog[index].title!,
                                  detailsdate: sportCatalog[index]
                                      .publishedAt
                                      .toString(),
                                  detailsImage:
                                      sportCatalog[index].urlToImage!)),
                        ),
                        child: NewsCardWidget(
                            urlText: sportCatalog[index].title!,
                            urlImage: sportCatalog[index].urlToImage),
                      );
                    }));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
