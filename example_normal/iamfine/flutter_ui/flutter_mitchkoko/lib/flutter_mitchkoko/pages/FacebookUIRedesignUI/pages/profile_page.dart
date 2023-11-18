import 'package:flutter/material.dart';

import '../helper/helper_index.dart';
import '../widgets/home/menubar.dart';
import '../widgets/home/post.dart';
import '../widgets/home/postbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const Text('Sonam Sharma'),
            ],
          ),
        ),
        body: ListView(
          children: [
            Container(
              height: 255,
              width: 400,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  GestureDetector(
                    onTap: () => {},
                    child: Column(
                      children: [
                        Container(
                          height: 170,
                          width: 400,
                          margin: const EdgeInsets.only(top: 10.0),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: Image(
                              image: AssetImage(
                                  Utils.assets('images/post/bird.jpg')),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    left: 140.0,
                    child: Container(
                      height: 120,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                        child: Image(
                            image: AssetImage(
                                Utils.assets('images/user/sonam.jpg')),
                            fit: BoxFit.cover),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: const Text('Sonam Sharma',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => {},
                    child: const Row(
                      children: [
                        Icon(Icons.add_circle),
                        Text('Add to Story'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[400],
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        Text(
                          'Edit Profile',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () => {}, icon: const Icon(Icons.more_horiz))
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: const Row(
                    children: [
                      Icon(Icons.book),
                      Text("Studied at IGNOU - The People's University",
                          style: TextStyle(fontSize: 16, color: Colors.black))
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: const Row(
                    children: [
                      Icon(Icons.gamepad),
                      Text("Single",
                          style: TextStyle(fontSize: 16, color: Colors.black))
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: const Row(
                    children: [
                      Icon(Icons.info),
                      Text("About",
                          style: TextStyle(fontSize: 16, color: Colors.black))
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Friends'),
                  TextButton(
                      onPressed: () => {}, child: const Text('Find Friends'))
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.black38,
            ),
            const Postbar(),
            const Menubar(),
            const Post(),
          ],
        ),
      ),
    );
  }
}
