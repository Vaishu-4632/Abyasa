import 'package:abhyasa/Screens/display.dart';
import 'package:abhyasa/Screens/playlistPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlaylistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 106, 141),
        title: Text('All Playlists'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('playlists').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          }

          final playlists = snapshot.data!.docs;

          if (playlists.isEmpty) {
            return Center(child: Text('No playlists found'));
          }

          return Container(
            margin: EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder( 
              itemCount: playlists.length,
              itemBuilder: (context, index) {
                final playlist = playlists[index].data() as Map; 
                final playlistName = playlist['playlistName'].toString();
                final selectedSongs = List.from(playlist['selectedSongs']);
                
                return ListTile(
                  
                  title: Text(playlistName,style: TextStyle(color: Colors.black,fontSize: 30),),
                  subtitle: Row(
                    //  mainAxisAlignment: MainAxisAlignment.s,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: selectedSongs.map((song) => Text(song as String,)).toList().asMap().entries.map((e) {
            int index = e.key;
            String song = e.value.data!;
            return Row(
              children: [
                Text(song),
            if (index != selectedSongs.length - 1) Text(' | '),
              ],
            );
                  }).toList(),
                  
                  ),
                  onTap: () {
                    Navigator.push(
                      context,MaterialPageRoute(builder: (context) => DisplayPage(playlistName,selectedSongs))
                    );
                  },
                );
              },
            ),
          );
        },),);}}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class PlaylistScreen extends StatefulWidget {
//   final String playlistName;
//   final List selectedSongs;

//   const PlaylistScreen({required this.playlistName, required this.selectedSongs});

//   @override
//   _PlaylistScreenState createState() => _PlaylistScreenState();
// }

// class _PlaylistScreenState extends State {
//    String playlistName = "";
//    List selectedSongs = [];
//   Future fetchPlaylistData(String playlistName, List selectedSongs) async {
//     QuerySnapshot snapshot = await FirebaseFirestore.instance
//         .collection('playlists')
//         .where('playlistName', isEqualTo: playlistName)
//         .get();

//     List playlistData = [];
//     if (snapshot.docs.isNotEmpty) {
//       playlistData = snapshot.docs.first['selectedSongs'];
//     }
//     return playlistData;
//   }
//    getDetails() async {
//     CollectionReference profileDetails =
//         FirebaseFirestore.instance.collection('playlists');
//     final result = await profileDetails.doc().get();
//     final details = result.data() as Map<String, dynamic>;
//     playlistName = details['playlistName'];
//      Navigator.push(context, MaterialPageRoute(builder: (context) => PlaylistScreen(playlistName: playlistName, selectedSongs: selectedSongs)));
   
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getDetails();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(playlistName),
//       ),
//       // body: FutureBuilder(
//       //   future: getDetails(),
//       //   builder: (context, snapshot) {
//       //     if (snapshot.connectionState == ConnectionState.waiting) {
//       //       return Center(
//       //         child: CircularProgressIndicator(),
//       //       );
//       //     } else if (snapshot.hasError) {
//       //       return Center(
//       //         child: Text('Error retrieving playlist data'),
//       //       );
//       //     // } else if (snapshot.data == null || snapshot.data!.isEmpty) {
//       //     //   return Center(
//       //     //     child: Text('No playlist data available'),
//       //     //   );
//       //     } else {
//       //       Text(playlistName);
//       //       // List songs = snapshot.data!;
//       //       // return ListView.builder(
//       //       //   itemCount: songs.length,
//       //       //   itemBuilder: (context, index) {
//       //       //     return ListTile(
//       //       //       title: Text(songs[index]),
//       //       //     );
//       //       //   },
//       //       // );
//       //     }
//       //   },
//       // ),
//     );
//   }
// }