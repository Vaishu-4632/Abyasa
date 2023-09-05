import 'package:abhyasa/Screens/NavBar.dart';
import 'package:abhyasa/Screens/New_playlist.dart';
import 'package:abhyasa/Screens/playlistPage.dart';
import 'package:flutter/material.dart';

class CreatePlaylist extends StatefulWidget {
  const CreatePlaylist({super.key});

  @override
  State<CreatePlaylist> createState() => _CreatePlaylistState();
}

class _CreatePlaylistState extends State<CreatePlaylist> {
   List playlistPages = [];
   PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        // leading: Padding(
        //   padding: const EdgeInsets.all(20.0),
        //   child: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        // ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(13, 152, 186, 1.0),
              Color.fromRGBO(0, 135, 189, 1.0),
              Color.fromRGBO(0, 103, 165, 1.0),
              Color.fromRGBO(15, 77, 146, 1.0)
            ],
          )),
        ),
      ),
      body: Container(
        // color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(13, 152, 186, 1.0),
            Color.fromRGBO(0, 135, 189, 1.0),
            Color.fromRGBO(0, 103, 165, 1.0),
            Color.fromRGBO(15, 77, 146, 1.0)
          ],
        )),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Create New Playlist', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 30),),
          SizedBox(height: 15,),
          IconButton(onPressed: (){
            Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>  NewPlaylist(),),);
          }, icon: Icon(Icons.add_circle_outline,color: Colors.white,size: 50,))
        ],
        
       ),
      ),
    );
  }
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
          SizedBox(height: 16),
          Text('Playlist content goes here...'),
        ],
      ),
    );
  }
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
}