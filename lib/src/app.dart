import 'package:flutter/material.dart';

import 'theme.dart';
import 'pages/landing_page.dart';

class ShopantApp extends StatelessWidget {
  const ShopantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopant',
      theme: AppTheme.dark(),
      home: const ShopantLandingPage(),
    );
  }
}
