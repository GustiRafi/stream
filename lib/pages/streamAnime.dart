// ignore_for_file: unused_import
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx/webviewx.dart';

class StreamAnime extends StatefulWidget {
  @override
  State<StreamAnime> createState() => _StreamAnimeState();
}

class _StreamAnimeState extends State<StreamAnime> {
  bool _isFullScreen = false;

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

  @override
  Widget build(BuildContext context) {
    Widget stream() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 3,
        ),
        child: WebViewX(
          javascriptMode: JavascriptMode.unrestricted,
          initialContent:
              "https://desustream.me/beta/stream/?id=SHcxQ1hPU2tkc2U4QlBBZVJVYjRpUT09",
          webSpecificParams: WebSpecificParams(
            webAllowFullscreenContent: true,
          ),
          height: _isFullScreen ? MediaQuery.of(context).size.height : 300,
          width: _isFullScreen ? MediaQuery.of(context).size.width : 200,
        ),
      );
    }

    Widget infoAnime() {
      return Container(
        margin: EdgeInsets.all(30),
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
        title: Text('Streaming'),
        backgroundColor: Colors.pink,
      ),
      body: ListView(
        children: [
          stream(),
          infoAnime(),
          episode(),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(_isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen),
      //   backgroundColor: Colors.pink,
      //   tooltip: 'Full Screen',
      //   onPressed: () {
      //     setState(() {
      //       _isFullScreen = !_isFullScreen;
      //     });
      //   },
      // ),
    );
  }
}
