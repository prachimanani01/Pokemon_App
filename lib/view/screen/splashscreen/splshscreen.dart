import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../routes/routes.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, Routes.home_page);
    });
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/2c245e43328107.57eb3e301ce8f.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
