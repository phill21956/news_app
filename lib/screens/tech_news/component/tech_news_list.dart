import 'package:flutter/material.dart';
import 'package:news_app/models/tech_news_model.dart';

import '../../../services/http_call.dart';
import '../../../widgets/news_card_widget.dart';
import '../../news_details/news_details_page.dart';

class TechNewsList extends StatefulWidget {
  const TechNewsList({Key? key}) : super(key: key);

  @override
  State<TechNewsList> createState() => _TechNewsListState();
}

class _TechNewsListState extends State<TechNewsList> {
  late Future<TechNewsModel> _techNewsList;

  @override
  void initState() {
    _techNewsList = HttpService.gettechNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _techNewsList,
        builder: (context, AsyncSnapshot<TechNewsModel> snapshot) {
          if (snapshot.hasData) {
            List<Article> techCatalog = snapshot.data!.articles;
            return Expanded(
                child: ListView.builder(
                    itemCount: techCatalog.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => NewsDetails(
                                  detailsAuthor: techCatalog[index].author,
                                  detailsContent: techCatalog[index].content,
                                  detailsTitle: techCatalog[index].title!,
                                  detailsdate:
                                      techCatalog[index].publishedAt.toString(),
                                  detailsImage:
                                      techCatalog[index].urlToImage)),
                        ),
                        child: NewsCardWidget(
                            urlText: techCatalog[index].title!,
                            urlImage: techCatalog[index].urlToImage!),
                      );
                    }));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
