import 'package:flutter/material.dart';

import '../screens/home_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  HomePage.id: (context) => const HomePage(),
 
};
