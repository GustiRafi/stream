// ignore_for_file: unused_import
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx/webviewx.dart';

class SearchResult extends StatefulWidget {
  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    Widget genres() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/genre');
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
                    'Action',
                    style: GoogleFonts.poppins(
                      color: Colors.pink,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/genre');
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
                    'Terbaru',
                    style: GoogleFonts.poppins(
                      color: Colors.pink,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/genre');
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
                    'Terbaru',
                    style: GoogleFonts.poppins(
                      color: Colors.pink,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/genre');
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
                    'Terbaru',
                    style: GoogleFonts.poppins(
                      color: Colors.pink,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/genre');
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
                    'Terbaru',
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

    Widget anime() {
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
                'https://otakudesu.lol/wp-content/uploads/2023/04/Edomae-Elf-Sub-Indo.jpg',
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
                      'Episode 8',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/detail-anime');
                    },
                    child: Text(
                      'Edomae Elf',
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
                    'Updated Day : Sabtu ',
                    style: GoogleFonts.poppins(),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Last Update : 27 Mei',
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
        title: Text('Search Result'),
        backgroundColor: Colors.pink,
      ),
      body: ListView(
        children: [
          genres(),
          Container(
            margin: EdgeInsets.all(30),
            child: Text(
              'result for : one piece',
              style: GoogleFonts.poppins(
                color: Colors.pink,
                fontSize: 15,
              ),
            ),
          ),
          anime(),
          anime(),
          anime(),
          anime(),
          anime(),
          anime(),
          anime(),
          anime(),
        ],
      ),
    );
  }
}
