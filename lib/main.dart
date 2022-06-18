import 'package:flutter/material.dart';
import './src/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3 Astronautas Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.grey, //00B761
          ),
        ),
        // colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.white,),
      ),
      initialRoute: '/',
      routes: customRoutes,
      // home: const Home(),
    );
  }
}
