import 'package:flutter/material.dart';

import 'song_page.dart';

class MusicplayerUI extends StatelessWidget {
  const MusicplayerUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SongPage(),
    );
  }
}
