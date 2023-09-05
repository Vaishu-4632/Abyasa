import 'package:flutter/material.dart';

class DisplayPage extends StatelessWidget {
  final String playlistName;
  final List selectedSongs;

  const DisplayPage(this.playlistName, this.selectedSongs);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(playlistName),
      ),
      body: ListView.builder(
        itemCount: selectedSongs.length,
        itemBuilder: (context, index) {
          final song = selectedSongs[index];
          return ListTile(
            title: Text(song),
          );
        },
      ),
    );
  }
}