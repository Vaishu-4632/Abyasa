import 'package:abhyasa/Screens/PlaylisPage.dart';
import 'package:abhyasa/Screens/create_palylist.dart';
import 'package:abhyasa/Screens/playlistPage.dart';
import 'package:flutter/material.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
   List playlistPages = [];
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Introduction Slider'),
      // ),
       body: PageView.builder(
        controller: pageController,
        itemBuilder: (context, index) {
          if (index == playlistPages.length) {
            return CreatePlaylist(); // Last page with "Create New Playlist"
          } else {
            return playlistPage(index); // Playlist page
          }
        },
        itemCount: playlistPages.length + 1,
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //      addNewPlaylistPage();
      //   },
      // ),
    );
  }

      // body: PageView.builder(
      //   controller: pageController,
      //   itemBuilder: (context, index) {
      //     if (index == 0) {
      //       return CreatePlaylist(); // First page with "Create New Playlist"
      //     } else {
      //       int playlistIndex = index - 1;
      //       return playlistPage(playlistIndex); // Playlist page
      //     }
      //   },
      //   itemCount: playlistPages.length + 1,
      // ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     addNewPlaylistPage();
      //   },
      // ),
  //   );
  // }
  //  Widget createNewPlaylistPage() {
  //   return Center(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Text(
  //           'Create New Playlist',
  //           style: TextStyle(fontSize: 24),
  //         ),
  //         SizedBox(height: 16),
  //         Icon(Icons.add, size: 48),
  //       ],
  //     ),
  //   );
  //  }
    Widget playlistPage(int index) {
    String title = playlistPages[index].title;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 24),
          ),
          // PlaylistScreen(),
          SizedBox(height: 16),
          Text('Playlist content goes here...'),
        ],
      ),
    );
  }
  //  Widget playlistPage(int playlistIndex) {
  //   String title = playlistPages[playlistIndex].title;

  //   return Center(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Text(
  //           title,
  //           style: TextStyle(fontSize: 24),
  //         ),
  //         SizedBox(height: 16),
  //         Text('Playlist content goes here...'),
  //       ],
  //     ),
  //   );
  // }
  void addNewPlaylistPage() {
    String playlistTitle = 'Playlist ${playlistPages.length + 1}';
    PlaylistPage newPlaylistPage = PlaylistPage(playlistTitle);

    setState(() {
      playlistPages.add(newPlaylistPage);
      pageController.animateToPage(
        playlistPages.length,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  // void addNewPlaylistPage() {
  //   String playlistTitle = 'Playlist ${playlistPages.length + 1}';
  //   PlaylistPage newPlaylistPage = PlaylistPage(playlistTitle);

  //   setState(() {
  //     playlistPages.add(newPlaylistPage);
  //     pageController.animateToPage(
  //       pageController.page!.toInt() + 1,
  //       duration: Duration(milliseconds: 500),
  //       curve: Curves.easeInOut,
  //     );
  //   });
  // }
  
  }
