import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFD700),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Game of Taps',
              style: TextStyle(
                fontFamily: "Ingrid_Darling",
                fontSize: 100,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 40,
                    offset: Offset(-10, 10),
                  )
                ],
              ),
            ),
            SizedBox(height: 50), // Add some space
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/game");
              },
              // load an image from the assets folder
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(131, 0, 0, 0),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Image.asset(
                  "assets/images/play-button.png",
                  width: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
