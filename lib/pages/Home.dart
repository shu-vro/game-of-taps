import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, final dynamic) async {
        if (didPop) return;
        final bool shouldPop = await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Exit App'),
                content: Text('Do you want to exit the app?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('No'),
                  ),
                  TextButton(
                    onPressed: () => SystemNavigator.pop(),
                    child: Text('Yes'),
                  ),
                ],
              ),
            ) ??
            false;

        if (context.mounted && shouldPop) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
