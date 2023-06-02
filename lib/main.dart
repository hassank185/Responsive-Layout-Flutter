import 'package:animated_responsive_layout_1/features/messenger/presentation/pages/home_feed.dart';
import 'package:animated_responsive_layout_1/features/messenger/data/model/data.dart' as data;
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: HomeFeed(currentUser: data.user_0),
    );
  }
}
