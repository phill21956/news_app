import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/screens/biz_news/component/biz_news_list.dart';

import '../../widgets/text_widget.dart';

class BusinessNewsPage extends StatelessWidget {
  const BusinessNewsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 10.r),
            child: const TextWidget(title: "Business News"),
          ),
          SizedBox(height: 10.h),
        const BizNewsList()
        ],
      ),
    );
  }
}