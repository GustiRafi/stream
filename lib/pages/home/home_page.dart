// ignore_for_file: unused_import
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ndelok/constans.dart';
import 'package:ndelok/pages/animeGenre.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> animeData = [];
  List<dynamic> genresData = [];

  void initState() {
    super.initState();
    fetchAnime();
    fecthGenreAnime();
  }

  Future<void> fecthGenreAnime() async {
    final url = Uri.parse(genreUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      genresData = jsonData;
    } else {
      print('Gagal mengambil data dari API.');
    }
  }

  Future<void> fetchAnime() async {
    final url = Uri.parse(animeUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        animeData = jsonData;
      });
    } else {
      // Handle jika terjadi kesalahan dalam mengambil data dari API.
      print('Gagal mengambil data dari API.');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 30.0,
          left: 30.0,
          right: 30.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ndelok',
              style: GoogleFonts.montserrat(
                color: Colors.pink,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Enjoy your movie',
              style: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 253, 83, 140),
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
      );
    }

    Widget genres() {
      return Container(
        margin: EdgeInsets.only(top: 30.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: 30,
              ),
              for (var genreItem in genresData)
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AnimeByGenre(slug: genreItem['slug']),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    margin: EdgeInsets.only(
                      right: 16,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.pink),
                        color: Colors.transparent),
                    child: Text(
                      genreItem['title'],
                      style: GoogleFonts.poppins(
                        color: Colors.pink,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    }

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

    return ListView(
      children: [
        header(),
        genres(),
        Container(
          margin: EdgeInsets.all(30),
          child: Text(
            'Anime Terbaru',
            style: GoogleFonts.poppins(
              color: Colors.pink,
              fontSize: 22,
            ),
          ),
        ),
        ListView.builder(
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
      ],
    );
  }
}
