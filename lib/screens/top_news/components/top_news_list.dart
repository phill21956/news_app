import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/models/top_news_model.dart';

import '../../../controllers/top_news_controller.dart';

class TopNewsList extends StatelessWidget {
  final TopNewsController topNewsController = Get.put(TopNewsController());

  TopNewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () {
          if (topNewsController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: topNewsController.topNewsList.length,
                itemBuilder: (context, index) {
                  List<Article> topNewsCatalog =
                      topNewsController.topNewsList[index].articles;
                  return Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.all(10.r),
                          child: Container(
                            width: 345,
                            height: 128,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      topNewsCatalog[index].urlToImage!),
                                  fit: BoxFit.fill),
                            ),
                            // child: Image.network(mov.posterPath),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.r),
                        child: Text(
                          topNewsCatalog[index].title!,
                          style: const TextStyle(
                              fontWeight: FontWeight.w800, color: Colors.white),
                        ),
                      ),
                    ],
                  );
                });
          }
        },
      ),
    );
  }
}
