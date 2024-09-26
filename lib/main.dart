import 'package:flutter/material.dart';
import 'package:flutter_calculator/home_page.dart';
import 'package:provider/provider.dart';
import 'themes/theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: Provider.of<ThemeProvider>(context).themeData,
      ),
    );
  }
}
