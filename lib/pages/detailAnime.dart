// ignore_for_file: unused_import, override_on_non_overriding_member
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailAnime extends StatefulWidget {
  @override
  State<DetailAnime> createState() => _DetailAnimeState();
}

class _DetailAnimeState extends State<DetailAnime> {
  @override
  Widget epsBox({required String title}) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/stream');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        margin: EdgeInsets.only(
          right: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.pink,
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    Widget sampul() {
      return Container(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://otakudesu.lol/wp-content/uploads/2023/04/Mahou-Shoujo-Magical-Destroyers-Sub-Indo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget infoAnime() {
      return Container(
        margin: EdgeInsets.all(30),
        child: Row(
          children: [
            ClipRRect(
              child: Image.network(
                'https://otakudesu.lol/wp-content/uploads/2023/04/Mahou-Shoujo-Magical-Destroyers-Sub-Indo.jpg',
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mahou Shoujo Magical Destroyers',
                    style: GoogleFonts.poppins(
                      color: Colors.pink,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '魔法少女マジカルデストロイヤーズ',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Skor : 6.74',
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Status : Ongoing',
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Genre : Action,Fantasi',
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget sinopsis() {
      return Container(
        margin: EdgeInsets.only(
          right: 30,
          left: 30,
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              margin: EdgeInsets.only(
                right: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.pink),
                color: Colors.transparent,
              ),
              child: Text(
                'Sinopsis',
                style: GoogleFonts.poppins(
                  color: Colors.pink,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Kembali ke tahun 2008, Jepang melancarkan sebuah program bernama “Perlindungan”. Salah satu metodenya adalah menyita seluruh hal-hal yang berbau Otaku. Keputusan ini pun mengundang banyak protes dari para penggemar.Setelah program tersebut berjalan, para Otaku mulai menghilang. Tidak ingin jati diri mereka hilang, segentilintir orang memilih melawan program pemerintah. Anarchy, Blue, dan Pink yang mampu menggunakan kekuatan sihir atau Mahou kini dipimpin oleh Otaku Hero. Mampukah mereka mengembalikan kejayaan Otaku seperti sedia kala?',
              style: GoogleFonts.poppins(),
            ),
          ],
        ),
      );
    }

    Widget episode() {
      return Container(
        margin: EdgeInsets.only(
          left: 30,
          top: 30,
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              margin: EdgeInsets.only(
                right: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.pink),
                color: Colors.transparent,
              ),
              child: Text(
                'Episode',
                style: GoogleFonts.poppins(
                  color: Colors.pink,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    epsBox(title: '1'),
                    epsBox(title: '2'),
                    epsBox(title: '3'),
                    epsBox(title: '4'),
                    epsBox(title: '5'),
                    epsBox(title: '6'),
                    epsBox(title: '7'),
                    epsBox(title: '8'),
                    epsBox(title: '9'),
                    epsBox(title: '10'),
                    epsBox(title: '11'),
                    epsBox(title: '12'),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('judul anime'),
        backgroundColor: Colors.pink,
      ),
      body: ListView(
        children: [
          sampul(),
          infoAnime(),
          sinopsis(),
          episode(),
        ],
      ),
    );
  }
}
