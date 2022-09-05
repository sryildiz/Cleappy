// ignore_for_file: prefer_const_constructors
import 'dart:math';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Cleappy",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 48,
                        fontFamily: 'Pontiac',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0),
                  ),
                  Text(
                    "::",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 48,
                        fontFamily: 'Pontiac',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 4),
                  ),
                ],
              ),
              Text(
                "Clean Works, Happy Customers",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontFamily: 'Pontiac',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0),
              ),
            ],
          ),
        ),
        nextScreen: HomePage(),
        duration: 3000,
        animationDuration: Duration(milliseconds: 2000),
        pageTransitionType: PageTransitionType.fade,
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey[400]!,
                  Colors.grey[600]!,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              width: 200.0,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Cleappy",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'Pontiac',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0),
                            ),
                            Text(
                              "::",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'Pontiac',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 4),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Anasayfa",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600),
                          ),
                          selectedColor: Colors.white70,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.info_sharp,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Hakkımızda",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.view_agenda,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Hizmetler",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.computer_sharp,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Projeler",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.call_sharp,
                            color: Colors.white,
                          ),
                          title: Text(
                            "İletişim",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
              curve: Curves.easeIn,
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 500),
              builder: (_, double val, __) {
                return (Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val)
                    ..rotateY((pi / 6) * val),
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("Cleeeapy"),
                    ),
                    body: Center(
                      child: Text("Cleappy mobil app"),
                    ),
                  ),
                ));
              }),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
            // onTap: () {
            //   setState(() {
            //     value == 0 ? value = 1 : value = 0;
            //   });
            // },
          )
        ],
      ),
    );
  }
}
