import 'dart:convert';

import 'package:abhyasa/Screens/NavBar.dart';
import 'package:abhyasa/Widgets/reusable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Intro1 extends StatefulWidget {
  const Intro1({super.key});

  @override
  State<Intro1> createState() => _Intro1State();
}

class _Intro1State extends State<Intro1> {
  // AudioPlayer audioPlayer = AudioPlayer();
  List data = [];
  
  var varHeader = {
  'access-token': 'TXQpzj3rcmbtWh5SBB_yzQ',
  'client': 'dc-_fknRkcARh3FwbANuxQ',
  'uid': 'gurkaran.bambhrah@gmail.com',
  };
  Future fetchData() async {
    final response = await http.get(Uri.parse('https://dev.abhyaasa.com/v1/general_audios.json?type=GeneralAudio&payment_required=true,'),headers: varHeader);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // final data = jsonData['data'];
      //  final meditationData = data.where((item) => item['type'] == 'Meditation' && item['price_in_inr'] == '₹ 0').toList();
        setState(() {
         final data = jsonData['data'];
      });
    }
  }
  String formatDuration(int seconds) {
    int minutes = (seconds / 60).floor();
    int remainingSeconds = seconds % 60;

    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
    void playAudio(String assetUrl) async {
    // await audioPlayer.play(assetUrl as Source);
    // Implement other logic as needed, such as showing a progress indicator or updating UI when audio playback starts
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData(); 
  }
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
        child:  SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              titleText('Pranayam'),
              
              const SizedBox(
                height: 10,
              ),
              subText('Concentration_Pranayam_English'),
             
              const SizedBox(
                height: 100,
              ),
              playButton((){
                playAudio('https://admin.abhyaasa.com/download_audio_file/111_Concentration_Pranayam_English.zip?se=2023-07-11T07%3A39%3A45Z&sig=EUK%2FHjRBmaaCeIQQTrYWVRCDmwEhbATzhjr%2FnqGBDAQ%3D&sp=r&sr=b&st=2023-07-11T07%3A14%3A45Z&type=audio_files');
              }),
            //    IconButton(
            //   icon: Icon(Icons.play_arrow),
            //   onPressed: () {
            //     playAudio();
            //   },
            // ),
             
              SizedBox(height: 50,),
              Text('4 min', style: TextStyle(color: Colors.white),)
            ],

          ),
        ),
      ),
      
    );
  }
}
