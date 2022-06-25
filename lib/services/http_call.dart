// https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5a3a5675239e41d396a7f358a1b76980
import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/models/tech_news_model.dart';
import 'package:news_app/models/top_news_model.dart';
import '../const/key.dart';

class HttpService {

 static Future<TopNewsModel> gettopNews() async {
    Response response = await get(Uri.parse(topNewsUrl));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var topNewsList = TopNewsModel.fromJson(body);
      return topNewsList;
    } else {
      throw '${response.body}: Error: could not get news';
    }
  }

  static Future<TechNewsModel> gettechNews() async {
    Response response = await get(Uri.parse(techNewsUrl));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var techNewsList = TechNewsModel.fromJson(body);
      return techNewsList;
    } else {
      throw '${response.body}: Error: could not get news';
    }
  }

  
}
