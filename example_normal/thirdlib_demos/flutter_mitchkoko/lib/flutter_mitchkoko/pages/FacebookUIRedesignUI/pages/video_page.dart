import 'package:flutter/material.dart';
import '../models/models_index.dart';

class VideoPage extends StatefulWidget {
  VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Videos',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                child: Tooltip(
                  message: 'Play Video Automatically',
                  child: Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      }),
                ),
              ),
            ],
          ),
        ),
        const Divider(thickness: 1, color: Colors.black26),
        Expanded(
          child: ListView.builder(
            itemCount: videoData.length,
            itemBuilder: (context, i) {
              return Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        iconSize: 50,
                        onPressed: videoData[i].avatarOnPressed,
                        icon: CircleAvatar(
                          radius: 80.0,
                          backgroundImage: AssetImage(videoData[i].avatarImage),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  videoData[i].name,
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                  onPressed: () => {},
                                  child: const Text(
                                    'Follow',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Wrap(
                              spacing: 10.0,
                              children: [
                                Text(
                                  videoData[i].time,
                                  style: const TextStyle(fontSize: 18.0),
                                ),
                                const Icon(Icons.public),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        iconSize: 30,
                        onPressed: videoData[i].moreOnPressed,
                        icon: const Icon(Icons.more_horiz_outlined),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.grey,
                          width: double.infinity,
                          height: 150,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            videoData[i].videoPostTitle,
                            style: const TextStyle(
                                fontSize: 18.0, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.thumb_up_alt_outlined),
                            onPressed: videoData[i].likeOnPressed,
                          ),
                          const Text('12', style: TextStyle(fontSize: 18.0)),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.message_outlined),
                            onPressed: videoData[i].commentOnPressed,
                          ),
                          const Text('10', style: TextStyle(fontSize: 18.0)),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.share_outlined),
                            onPressed: videoData[i].shareOnPressed,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
