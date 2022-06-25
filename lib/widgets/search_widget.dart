import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      margin: const EdgeInsets.fromLTRB(10, 0, 20, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xfff0f1fa),
        ),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10.r, 0, 0, 0),
          suffixIcon: const Icon(Icons.search,
              color: Color.fromARGB(255, 176, 171, 171)),
          hintText: 'Search',
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 176, 171, 171),
              fontWeight: FontWeight.bold),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
