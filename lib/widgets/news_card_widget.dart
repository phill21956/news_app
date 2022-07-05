import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({
    Key? key,
    required this.urlText,
    required this.urlImage,
  }) : super(key: key);

  final String? urlImage;
  final String urlText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.all(10.r),
            child: CachedNetworkImage(
              imageUrl: urlImage ?? "",
              imageBuilder: (context, imageProvider) => Container(
                width: 345,
                height: 128,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: imageProvider,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.4), BlendMode.dstATop),
                      filterQuality: FilterQuality.low,
                      fit: BoxFit.cover),
                ),
                // child: Image.network(mov.posterPath),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.r),
          child: Text(
            urlText,
            style: const TextStyle(
                fontWeight: FontWeight.w800, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
