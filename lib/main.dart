import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whether_app/pages/home_page.dart';
import 'package:whether_app/pages/search_page.dart';
import 'package:whether_app/providers/wheather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WheatherProvider();
      },
      child: const WheatherApp()));
}

class WheatherApp extends StatelessWidget {
  const WheatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wheather App',
      theme: ThemeData(
        primarySwatch:
            Provider.of<WheatherProvider>(context).wheatherData == null
                ? Colors.blue
                : Provider.of<WheatherProvider>(context)
                    .wheatherData!
                    .getThemeColor(),
      ),
      home: HomePage(),
      routes: routes,
    );
  }
}

final Map<String, WidgetBuilder> routes = {
  'home_page': (BuildContext context) => HomePage(),
  'search_page': (BuildContext context) => SearchPage(),
};
