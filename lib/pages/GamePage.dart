import 'dart:math';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

MaterialPageRoute<void> DeclareWinner(String color) {
  return MaterialPageRoute<void>(
    fullscreenDialog: true,
    maintainState: false,
    builder: (BuildContext context) {
      return PopScope(
          canPop: false,
          onPopInvokedWithResult: (bool didPop, final dynamic) async {
            if (didPop) return;
            final bool shouldPop = await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Alert'),
                    content: Text('Go back to home?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text('No'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, "/"),
                        child: Text('Yes'),
                      ),
                    ],
                  ),
                ) ??
                false;

            if (context.mounted && shouldPop) {
              Navigator.pushNamed(context, "/");
            }
          },
          child: Scaffold(
            backgroundColor: color == "Red" ? Colors.amber : Colors.lightBlue,
            appBar: AppBar(
              title: Text(''),
              backgroundColor: color == "Red" ? Colors.amber : Colors.lightBlue,
              leading: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$color Team wins!',
                    style: TextStyle(
                      fontFamily: "Ingrid_Darling",
                      fontSize: 80,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 40,
                          offset: Offset(-10, 10),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/");
                        },
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
                            "assets/images/exit-button.png",
                            width: 150,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 22,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/game");
                        },
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
                            "assets/images/replay-button.png",
                            width: 150,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ));
    },
  );
}

class _GamePageState extends State<GamePage> {
  int point = 50;

  void incrementCounter() {
    setState(() {
      point = min(100, max(0, point + 2));
      if (point == 100) {
        Navigator.of(context).push(
          DeclareWinner("Blue"),
        );
      }
    });
  }

  void decrementCounter() {
    setState(() {
      point = min(100, max(0, point - 2));
      if (point == 0) {
        Navigator.of(context).push(
          DeclareWinner("Red"),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: const Text('Game of Taps'),
      // ),
      body: Stack(children: [
        Column(
          children: [
            Container(
              height: screenHeight * point / 100,
              color: Colors.blue,
            ),
            Container(
              height: screenHeight * (100 - point) / 100,
              color: Colors.red,
            ),
          ],
        ),
        Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  incrementCounter();
                },
                child: Container(color: Colors.transparent),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  decrementCounter();
                },
                child: Container(color: Colors.transparent),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
