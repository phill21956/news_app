import 'dart:io';
import 'package:flutter/material.dart';
import 'package:news_app/screens/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'routes/routes.dart';

void main() {
 // HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}
// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        initialRoute: HomePage.id,
        routes: routes,
      ),
    );
  }
}
