import 'package:flutter/material.dart';
import 'package:news_app/models/ent_news_model.dart';

import '../../../services/http_call.dart';
import '../../../widgets/news_card_widget.dart';
import '../../news_details/news_details_page.dart';

class EntertainmentNewsList extends StatefulWidget {
  const EntertainmentNewsList({Key? key}) : super(key: key);

  @override
  State<EntertainmentNewsList> createState() => _EntertainmentNewsListState();
}

class _EntertainmentNewsListState extends State<EntertainmentNewsList> {
  late Future<EntNewsModel> _entertainmentNewsList;

  @override
  void initState() {
    _entertainmentNewsList = HttpService.getentertainmentNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _entertainmentNewsList,
        builder: (context, AsyncSnapshot<EntNewsModel> snapshot) {
          if (snapshot.hasData) {
            List<Article> entertainmentCatalog = snapshot.data!.articles;
            return Expanded(
                child: ListView.builder(
                    itemCount: entertainmentCatalog.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => NewsDetails(
                                  detailsAuthor:
                                      entertainmentCatalog[index].author!,
                                  detailsContent:
                                      entertainmentCatalog[index].content!,
                                  detailsTitle:
                                      entertainmentCatalog[index].title!,
                                  detailsdate: entertainmentCatalog[index]
                                      .publishedAt
                                      .toString(),
                                  detailsImage:
                                      entertainmentCatalog[index].urlToImage!)),
                        ),
                        child: NewsCardWidget(
                            urlText: entertainmentCatalog[index].title!,
                            urlImage: entertainmentCatalog[index].urlToImage!),
                      );
                    }));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
