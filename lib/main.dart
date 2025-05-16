
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoliday_llp/screens/portfolio_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Portfolio App',
          theme: ThemeData(
            primaryColor: const Color(0xFFE05D37),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFFE05D37),
              primary: const Color(0xFFE05D37),
            ),
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'Roboto',
          ),
          home: child,
        );
      },
      child: const PortfolioPage(),
    );
  }
}