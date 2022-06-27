import 'package:flutter/material.dart';
import 'package:news_app/models/biz_news_model.dart';

import '../../../services/http_call.dart';
import '../../../widgets/news_card_widget.dart';
import '../../news_details/news_details_page.dart';

class BizNewsList extends StatefulWidget {
  const BizNewsList({Key? key}) : super(key: key);

  @override
  State<BizNewsList> createState() => _BizNewsListState();
}

class _BizNewsListState extends State<BizNewsList> {
  late Future<BusinessModel> _businessNewsList;

  @override
  void initState() {
    _businessNewsList = HttpService.getbusinessNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _businessNewsList,
        builder: (context, AsyncSnapshot<BusinessModel> snapshot) {
          if (snapshot.hasData) {
            List<Article> businessCatalog = snapshot.data!.articles;
            return Expanded(
                child: ListView.builder(
                    itemCount: businessCatalog.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => NewsDetails(
                                  detailsAuthor: businessCatalog[index].author!,
                                  detailsContent:
                                      businessCatalog[index].content!,
                                  detailsTitle: businessCatalog[index].title!,
                                  detailsdate: businessCatalog[index]
                                      .publishedAt
                                      .toString(),
                                  detailsImage:
                                      businessCatalog[index].urlToImage!)),
                        ),
                        child: NewsCardWidget(
                            urlText: businessCatalog[index].title!,
                            urlImage: businessCatalog[index].urlToImage!),
                      );
                    }));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
