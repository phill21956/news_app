import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/details_stack_widget.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails(
      {required this.detailsTitle,
      required this.detailsAuthor,
      required this.detailsContent,
      required this.detailsdate,
      required this.detailsImage,
      Key? key})
      : super(key: key);
  final String? detailsImage;
  final String detailsTitle;
  final String? detailsContent;
  final String? detailsAuthor;
  final String detailsdate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        DetailsStackWidget(detailsImage: detailsImage!),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(detailsdate,
                  //  'Monday, 10 May 2021',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xff2E0505))),
              SizedBox(height: 10.h),
              Text(detailsTitle,
                  // 'WHO classifies triple-mutant Covid variant from India as global health risk',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff121212))),
              SizedBox(height: 10.h),
              Text(detailsContent ?? "",
                  // 'A World Health Organization official said Monday it is reclassifying the highly contagious triple-mutant Covid variant spreading in India as a “variant of concern,” indicating that it’s become a...Read More',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  )),
              SizedBox(height: 10.h),
              Text(detailsAuthor?? "",
                  // 'Published by Berkeley Lovelace Jr.',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff2E0505))),
            ],
          ),
        )
      ],
    ));
  }
}
