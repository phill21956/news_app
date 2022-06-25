import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/screens/biz_news/biz_news_page.dart';
import 'package:news_app/screens/ent_news/ent_news_page.dart';
import 'package:news_app/screens/sport_news/sport_news_page.dart';
import 'package:news_app/screens/tech_news/tech_news_page.dart';
import 'package:news_app/screens/top_news/top_news_page.dart';
import '../widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> _tabList = [
    const Tab(child: Text('Top')),
    const Tab(
      child: Text('Technology'),
    ),
    const Tab(
      child: Text('Business'),
    ),
    const Tab(
      child: Text('Sports'),
    ),
    const Tab(
      child: Text('Entertainment'),
    ),
  ];
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabList.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: const Color(0xfffafafa),
        title: const SearchWidget(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.circle_notifications,
                  size: 38.sp, color: const Color.fromARGB(255, 246, 128, 132)))
        ],
        bottom: PreferredSize(
            child: TabBar(
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                isScrollable: true,
                controller: _tabController,
                tabs: _tabList),
            preferredSize: Size.fromHeight(30.h)),
      ),
      body: TabBarView(controller: _tabController, children: [
        Padding(
          padding: EdgeInsets.all(8.r),
          child:const TopNewsPage(),
        ),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: const TechNewsPage(),
        ),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: const BusinessNewsPage(),
        ),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: const SportNewsPage(),
        ),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: const EntertainmentNewsPage(),
        ),
      ]),
    );
  }
}
