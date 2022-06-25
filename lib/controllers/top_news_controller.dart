import 'package:get/get.dart';
import 'package:news_app/models/top_news_model.dart';
import 'package:news_app/services/http_call.dart';

class TopNewsController extends GetxController {
  var isLoading = true.obs;
  var topNewsList = <TopNewsModel>[].obs;

  @override
  void onInit() {
    topNews();
    super.onInit();
  }

  void topNews() async {
    try {
      isLoading(true);
      var products = await HttpService.gettopNews();
      topNewsList.assign(products);
    } finally {
      isLoading(false);
    }
  }
}
