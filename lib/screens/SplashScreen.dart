import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/salineq_logo.png'),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const CircularProgressIndicator()
            ),
          ],
        ),
      ),
    );
  }
}