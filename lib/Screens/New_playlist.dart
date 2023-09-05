import 'dart:convert';

import 'package:abhyasa/Model/model.dart';
import 'package:abhyasa/Screens/Introduction.dart';
import 'package:abhyasa/Screens/PlaylisPage.dart';
import 'package:abhyasa/Screens/playlistPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Model/SongModel.dart';

class NewPlaylist extends StatefulWidget {
  const NewPlaylist({super.key});

  @override
  State<NewPlaylist> createState() => _NewPlaylistState();
}

class _NewPlaylistState extends State<NewPlaylist> {
  String playlistName = "";
  List selectedSongs = [];
  List asanaNames = [];
  List asanaDuration = [];
  List asanaData = [];
  List meditationNames = [];
  List meditationDuration = [];
  List chantNames = [];
  List chantDuration = [];
  List kriyaNames = [];
  List kriyaDuration = [];
  List asanaSelectedStatus = [false,false,false,false,false,false,false,false];
  List mediationSelectedStatus = [false,false,false,false,false,false,false,false,false,false];
  List chantSelectedStatus = [false,false,false,false,false,false,false,false];
  List kriyaSelectedStatus = [false,false,false,false,false,false];



  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    fetchAsanaData();
    fetchMeditationData();
    fetchChantData();
    fetchKriyaData();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
  }
  void saveSelectedSongs(String playlistName, List selectedSongs) {
     FirebaseFirestore.instance.collection('playlists').add({
       'playlistName': playlistName,
       'selectedSongs': selectedSongs,
     }).then((value) {
       print("Selected songs saved successfully!");
     }).catchError((error) {
       print("Failed to save selected songs: $error");
     });
   }
  


  Future createPlaylist() async {
    String playlistName = controller.text;
    saveSelectedSongs(playlistName, selectedSongs);
    // List songsList = [];
    // for (Song song in selectedSongs) {
    //   songsList.add(song.toMap());
    // }
    CollectionReference playlistsRef =
        FirebaseFirestore.instance.collection('playlists');

    // DocumentReference playlistRef = await playlistsRef.add({
    //   'name': playlistName,
    //   'songs': selectedSongs.map((song) => song.toMap()).toList(),
    // });

    // // print('New Playlist ID: ${playlistRef.documentID}');
    // print('New Playlist ID: ${playlistRef.id}');

    setState(() {
      selectedSongs.clear();
      controller.clear();
    });
    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PlaylistScreen(
       
      ),
    ),
  );
    // Navigator.pushNamed(context, '/playlist');
  }
  void getDetails() async {
    CollectionReference profileDetails =
        FirebaseFirestore.instance.collection('playlists');
    final result = await profileDetails.doc().get();
    final details = result.data() as Map<String, dynamic>;
    playlistName = details['playlistName'];
     Navigator.push(context, MaterialPageRoute(builder: (context) => PlaylistScreen()));
   
  }
  //  Future fetchPlaylistData(String playlistName, List selectedSongs) async {
  // FirebaseFirestore.instance.collection('playlists').get().then((QuerySnapshot snapshot){
  //   snapshot.docs.forEach((doc){
  //     String playlistName = doc.data()! ['playlistName'];
  //     List selectedSongs = doc.data()['selectedSongs'];
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => PlaylistScreen(playlistName: playlistName, selectedSongs: selectedSongs)));
  //   });
  //  });
  // }
  //  }

  var varHeader = {
    'access-token': 'TXQpzj3rcmbtWh5SBB_yzQ',
    'client': 'dc-_fknRkcARh3FwbANuxQ',
    'uid': 'gurkaran.bambhrah@gmail.com',
  };
  Future fetchAsanaData() async {
    final response = await http.get(
        Uri.parse(
            'https://dev.abhyaasa.com/v1/general_audios.json?type=GeneralAudio&payment_required=true,'),
        headers: varHeader);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final data = jsonData['data'];
      final asanaData = data
          .where((item) => item['type'] == 'Asana'
              // && item['price_in_inr'] == '₹ 0'
              )
          .toList();
      setState(() {
        asanaNames = asanaData.map((item) => item['name']).toList();
        asanaDuration = asanaData.map((item) => item['duration']).toList();
      });
    }
  }

  Future fetchMeditationData() async {
    final response = await http.get(
        Uri.parse(
            'https://dev.abhyaasa.com/v1/general_audios.json?type=GeneralAudio&payment_required=true,'),
        headers: varHeader);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final data = jsonData['data'];
      final meditationData = data
          .where((item) => item['type'] == 'Meditation'
              // && item['price_in_inr'] == '₹ 0'
              )
          .toList();
      setState(() {
        meditationNames = meditationData.map((item) => item['name']).toList();
        meditationDuration =
            meditationData.map((item) => item['duration']).toList();
      });
    }
  }

  Future fetchChantData() async {
    final response = await http.get(
        Uri.parse(
            'https://dev.abhyaasa.com/v1/general_audios.json?type=GeneralAudio&payment_required=true,'),
        headers: varHeader);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final data = jsonData['data'];
      final chantData = data
          .where((item) => item['type'] == 'Chant'
              // && item['price_in_inr'] == '₹ 0'
              )
          .toList();
      setState(() {
        chantNames = chantData.map((item) => item['name']).toList();
        chantDuration = chantData.map((item) => item['duration']).toList();
      });
    }
  }

  Future fetchKriyaData() async {
    final response = await http.get(
        Uri.parse(
            'https://dev.abhyaasa.com/v1/general_audios.json?type=GeneralAudio&payment_required=true,'),
        headers: varHeader);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final data = jsonData['data'];
      final kriyaData = data
          .where((item) => item['type'] == 'ArtExcel'
              // && item['price_in_inr'] == '₹ 0'
              )
          .toList();
      setState(() {
        kriyaNames = kriyaData.map((item) => item['name']).toList();
        kriyaDuration = kriyaData.map((item) => item['duration']).toList();
      });
    }
  }
  List playlistPages = [];
   PageController pageController = PageController(initialPage: 0);
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

  final List asanas = [];

  TabBar get _tabBar => const TabBar(
        indicatorColor: Colors.white,
        isScrollable: true,
        tabs: [
          Tab(
            text: 'ASANA',
          ),
          Tab(
            text: 'MEDITATION',
          ),
          Tab(
            text: 'CHANTS',
          ),
          Tab(
            text: 'KRIYA',
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          backgroundColor: const Color.fromARGB(255, 29, 106, 141),
          title: TextFormField(
            controller: controller,
            
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,
              hintText: "Add your playlist title",
              hintStyle: TextStyle(color: Colors.white54),
            ),
            // hintText:"Add your playlist title",
            // style: TextStyle(color: Colors.white54),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 14),
              child: IconButton(
                onPressed: () {
                   createPlaylist();
                            Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => 
                  PlaylistScreen()));
                },
                icon: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(83, 176, 199, 1),
                  Color.fromRGBO(53, 147, 184, 1),
                  Color.fromRGBO(40, 136, 160, 1),
                  Color.fromRGBO(26, 121, 145, 1),
                ],
              )),
              child: _tabBar,
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 20),
                  child: Column(
                    children: [
                      const Text(
                        'On device and ready to play ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 25),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: asanaNames.length,
                          itemBuilder: (context, index) {
                            bool isSelected =
                                selectedSongs.contains(asanaNames[index]);
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, bottom: 3),
                                      child: Text( 
                                        asanaNames[index],
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        '${(double.parse(asanaDuration[index]) / 60).toStringAsFixed(2)} min ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    const Divider(
                                      height: 5,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        asanaSelectedStatus[index] = !asanaSelectedStatus[index];
                                          if (asanaSelectedStatus[index]) {
         selectedSongs.add(asanaNames[index]);
       } else {
         selectedSongs.remove(asanaNames[index]);
       }
     
                                        // asanaNames[index] =
                                        //     asanaNames[index] == "true"
                                        //         ? "false"
                                        //         : "true";
                                      });
                                    },
                                    // icon: Icon(isSelected? Icons.check : Icons.add_circle_outline)),
                                    icon: Icon(asanaSelectedStatus[index]
                                      // asanaNames[index] == "true"
                                        ? Icons.check
                                        : Icons.add_circle_outline)),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                  child: Column(
                    children: [
                      Text(
                        'On device and ready to play ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 25),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: meditationNames.length,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, bottom: 3),
                                      child: Text(
                                        meditationNames[index],
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        '${(double.parse(meditationDuration[index]) / 60).toStringAsFixed(2)} min ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                      height: 2,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        mediationSelectedStatus[index] = !mediationSelectedStatus[index];
                                        if (mediationSelectedStatus[index]) {
         selectedSongs.add(meditationNames[index]);
       } else {
         selectedSongs.remove(meditationNames[index]);
       }
     
                                       
                                      });
                                    },
                                    icon: Icon(mediationSelectedStatus[index]
                                        ? Icons.check
                                        : Icons.add_circle_outline)),

                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                  child: Column(
                    children: [
                      Text(
                        'On device and ready to play ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 25),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: chantNames.length,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, bottom: 3),
                                      child: Text(
                                        chantNames[index],
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        '${(double.parse(chantDuration[index]) / 60).toStringAsFixed(2)} min ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                      height: 2,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        chantSelectedStatus[index] = !chantSelectedStatus[index];
                                        if (chantSelectedStatus[index]) {
         selectedSongs.add(chantNames[index]);
       } else {
         selectedSongs.remove(chantNames[index]);
       }
     
                                        // asanaNames[index] =
                                        //     asanaNames[index] == "true"
                                        //         ? "false"
                                        //         : "true";
                                      });
                                    },
                                    // icon: Icon(isSelected? Icons.check : Icons.add_circle_outline)),
                                    icon: Icon(chantSelectedStatus[index]
                                      // asanaNames[index] == "true"
                                        ? Icons.check
                                        : Icons.add_circle_outline)),

                                // Icon(Icons.add_circle_outline_rounded,color: Colors.black,)
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                  child: Column(
                    children: [
                      Text(
                        'On device and ready to play ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 25),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: kriyaNames.length,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, bottom: 3),
                                      child: Text(
                                        kriyaNames[index],
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        '${(double.parse(kriyaDuration[index]) / 60).toStringAsFixed(2)} min ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                      height: 2,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                               IconButton(
                                    onPressed: () {
                                      setState(() {
                                        kriyaSelectedStatus[index] = !kriyaSelectedStatus[index];
                                        if (kriyaSelectedStatus[index]) {
         selectedSongs.add(kriyaNames[index]);
       } else {
         selectedSongs.remove(kriyaNames[index]);
       }
     
                                        // asanaNames[index] =
                                        //     asanaNames[index] == "true"
                                        //         ? "false"
                                        //         : "true";
                                      });
                                    },
                                    // icon: Icon(isSelected? Icons.check : Icons.add_circle_outline)),
                                    icon: Icon(kriyaSelectedStatus[index]
                                      // asanaNames[index] == "true"
                                        ? Icons.check
                                        : Icons.add_circle_outline)),

                                // Icon(Icons.add_circle_outline_rounded,color: Colors.black,)
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
