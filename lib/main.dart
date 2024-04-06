// ignore_for_file: unused_import
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ndelok/pages/animeGenre.dart';
import 'package:ndelok/pages/detailAnime.dart';
import 'package:ndelok/pages/home/main_page.dart';
import 'package:ndelok/pages/splashPage.dart';
import 'package:ndelok/pages/streamAnime.dart';
import 'package:ndelok/pages/searchResult.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ndelok',
      debugShowCheckedModeBanner: false,
      // routes: {
      //   '/': (context) => SplashPage(),
      //   '/home': (context) => MainPage(),
      //   '/genre': (context) => AnimeByGenre(),
      //   '/detail-anime': (context) => DetailAnime(),
      //   '/stream': (context) => StreamAnime(),
      //   '/result': (context) => SearchResult(),
      // },
      home: SplashPage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Ndelok'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//         ),
//       ),
//     );
//   }
// }
