// ignore_for_file: unused_import, override_on_non_overriding_member
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ndelok/constans.dart';

class AnimeByGenre extends StatefulWidget {
  final String slug;

  AnimeByGenre({required this.slug});
  @override
  State<AnimeByGenre> createState() => _AnimeByGenreState();
}

class _AnimeByGenreState extends State<AnimeByGenre> {
  List<dynamic> animeData = [];

  void initState() {
    super.initState();
    fetchAnime();
  }

  Future<void> fetchAnime() async {
    String slug = widget.slug;
    final url = Uri.parse('$genreUrl/$slug');
    final response = await http.get(url);
    // print(slug);
    // print('$genreUrl/$slug');

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      animeData = jsonData;
    } else {
      print('Gagal mengambil data dari API.');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget anime(
        {required imageUrl,
        required episode,
        required title,
        required updatedDay,
        required slug,
        required updatedDate}) {
      return Container(
        margin: EdgeInsets.only(right: 30, left: 30, bottom: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.pink)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.network(
                imageUrl,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                    margin: EdgeInsets.only(
                      right: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.pink,
                    ),
                    child: Text(
                      episode,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, slug);
                    },
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Updated Day : $updatedDay ',
                    style: GoogleFonts.poppins(),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Last Update : $updatedDate',
                    style: GoogleFonts.poppins(),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.slug),
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
        shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: animeData.length,
          itemBuilder: (context, index) {
          final animeItem = animeData[index];
          return anime(
              imageUrl: animeItem['imageUrl'],
              episode: animeItem['eps'],
              title: animeItem['title'],
              updatedDay: animeItem['updatedDay'],
              slug: animeItem['slug'],
              updatedDate: animeItem['updatedDate']);
        },
      ),
    );
  }
}
