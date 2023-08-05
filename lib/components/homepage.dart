import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            //Background Colour
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 44, 47, 54),
                  Color.fromARGB(255, 143, 149, 161),
                  Color.fromARGB(255, 109, 114, 124),
                ],
              ),
            ),
            // Icons Bar
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  //Icons for navigation
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 30,
                          semanticLabel: 'Menu Button',
                        ),
                        onPressed: () {},
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.wifi,
                              color: Colors.white,
                              size: 30,
                              semanticLabel: 'Menu Button',
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.settings_sharp,
                              color: Colors.white,
                              size: 30,
                              semanticLabel: 'Menu Button',
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.info_outline,
                              color: Colors.white,
                              size: 30,
                              semanticLabel: 'Menu Button',
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  // Profile Picture
                  Image.asset(
                    'assets/drone.png',
                    scale: 0.85,
                  ),
                  // Image.asset(
                  //   'assets/drone.png',
                  //   fit: BoxFit.fitWidth,
                  // ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  //Battery percentage and camera option
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.battery_full,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              '100%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// appBar: AppBar(
//   title: const Text('Arjuna'),
// ),
