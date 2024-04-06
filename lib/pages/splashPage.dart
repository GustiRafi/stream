import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndelok/pages/home/main_page.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLoading = true;

  @override
  void initState() {
    Timer(Duration(seconds: 7), () => Navigator.push(context, MaterialPageRoute(builder: ((context) => MainPage()))));
    super.initState();
    // Simulasikan tugas asinkron seperti memuat data
    simulateAsyncTask();
  }

  void simulateAsyncTask() async {
    // Tunggu selama 3 detik sebagai contoh
    await Future.delayed(Duration(seconds: 5));

    // Setelah selesai, perbarui status loading menjadi false
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Text(
              'Ndelok',
              style: GoogleFonts.montserrat(
                color: Colors.pink,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Tampilkan CircularProgressIndicator saat isLoading true
          if (isLoading)
            Container(
              color: Colors.black54,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.pink,
                ),
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                'From GustiRafi',
                style: GoogleFonts.poppins(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
