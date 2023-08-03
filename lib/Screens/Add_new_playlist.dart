import 'dart:convert';

import 'package:abhyasa/Widgets/reusable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:abhyasa/Model/model.dart';


class AddNewPlaylist extends StatefulWidget {
  const AddNewPlaylist({super.key});

  @override
  State<AddNewPlaylist> createState() => _AddNewPlaylistState();

}

class _AddNewPlaylistState extends State<AddNewPlaylist> {
  List meditationNames = [];
  List meditationDuration = [];
  List meditationDownloadNames = [];
  List meditationDownloadDuration = [];
  List asanaDownloadNames = [];
  List asanaDownloadDuration = [];
  List chantDownloadNames = [];
  List chantDownloadDuration = [];
  List kriyaDownloadNames = [];
  List kriyaDownloadDuration = [];
  List asanaNames = [];
  List asanaDuration = [];
  List chantNames = [];
  List chantDuration = [];
  List kriyaNames = [];
  List kriyaDuration = [];
  List durationsInMinutes = [];
  bool isPressed = false;
  bool isPadmasadhana = true;
  bool isSanyam = true;
  bool isBogar = true;
  bool isShantimantra = true;
  bool isWarmh = true;
  bool isWarmE = true;
  bool isSurya = true;
  bool ispadma = true;
  bool isConcentration = true;
  bool isHariom = true;
  bool isPanchakosha = true;
  bool isSilence = true;
   bool isAmanercer = true;
    bool isAtomo = true;
     bool isAura = true;
      bool isBacktosource = true;


  // TabController? _controller;
  // final OnAudioQuery _audioQuery = OnAudioQuery();
  @override
  void initState() {
    super.initState();
     fetchFreeMeditationData();
     fetchDownloadMeditationData();
     fetchFreeAsanaData();
     fetchDownloadAsanaData();
     fetchchantsData();
     fetchkriyaData();
  }
  var varHeader = {
  'access-token': 'TXQpzj3rcmbtWh5SBB_yzQ',
  'client': 'dc-_fknRkcARh3FwbANuxQ',
  'uid': 'gurkaran.bambhrah@gmail.com',
  };
  

  Future fetchFreeMeditationData() async {
    final response = await http.get(Uri.parse('https://dev.abhyaasa.com/v1/general_audios.json?type=GeneralAudio&payment_required=true,'),headers: varHeader);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final data = jsonData['data'];
       final meditationData = data.where((item) => item['type'] == 'Meditation' && item['price_in_inr'] == '₹ 0').toList();
      // final meditationData = data.where((item) => item['type'] == 'Meditation').toList();
      // final meditationPriceInInr = data.where((item) => item['price_in_inr'] == '₹ 0').toList();
        setState(() {
        meditationNames = meditationData.map((item) => item['name']).toList();
        meditationDuration = meditationData.map((item) => item['duration']).toList();
      });
    }
  }
  Future fetchDownloadMeditationData() async {
    final response = await http.get(Uri.parse('https://dev.abhyaasa.com/v1/general_audios.json?type=GeneralAudio&payment_required=true,'),headers: varHeader);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final data = jsonData['data'];
      final meditationDownloadData = data.where((item) => item['type'] == 'Meditation' && item['price_in_inr'] != '₹ 0').toList();
      // final meditationDownloadData = data.where((item) => item['type'] == 'Meditation').toList();
      // final meditationPriceInInr = data.where((item) => item['price_in_inr'] != '₹ 0').toList();
        setState(() {
        meditationDownloadNames = meditationDownloadData.map((item) => item['name']).toList();
        meditationDownloadDuration = meditationDownloadData.map((item) => int.tryParse(item['duration']) != null ? Duration(seconds: int.parse(item[ 'duration'],radix: 10)).inMinutes.toString() : null).toList();
      });
    }
  }
  Future fetchFreeAsanaData() async {
    final response = await http.get(Uri.parse('https://dev.abhyaasa.com/v1/general_audios.json?type=GeneralAudio&payment_required=true,'),headers: varHeader);
    if (response.statusCode == 200) { 
      final jsonData = jsonDecode(response.body);
      final data = jsonData['data'];
      final asanaData = data.where((item) => item['type'] == 'Asana' && item['price_in_inr'] == '₹ 0').toList();
      setState(() {
        asanaNames = asanaData.map((item) => item['name']).toList();
        asanaDuration = asanaData.map((item) => item['duration']).toList();
        
      });
    }
  }
  Future fetchDownloadAsanaData() async {
    final response = await http.get(Uri.parse('https://dev.abhyaasa.com/v1/general_audios.json?type=GeneralAudio&payment_required=true,'),headers: varHeader);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final data = jsonData['data'];
      final asanaDownloadData = data.where((item) => item['type'] == 'Asana' && item['price_in_inr'] != '₹ 0').toList();
      setState(() {
        asanaDownloadNames = asanaDownloadData.map((item) => item['name']).toList();
        asanaDownloadDuration = asanaDownloadData.map((item) => item['duration']).toList();
      });
    }
  }
  Future fetchchantsData() async {
    final response = await http.get(Uri.parse('https://dev.abhyaasa.com/v1/general_audios.json?type=GeneralAudio&payment_required=true,'),headers: varHeader);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final data = jsonData['data'];
      final chantData = data.where((item) => item['type'] == 'Chant' && item['price_in_inr'] == '₹ 0').toList();
      // final chantData = data.where((item) => item['type'] == 'Chant').toList();
      setState(() {
        chantNames = chantData.map((item) => item['name']).toList();
      chantDuration = chantData.map((item) => item['duration']).toList();
      });
    }
  }
  Future fetchDownloadchantsData() async {
    final response = await http.get(Uri.parse('https://dev.abhyaasa.com/v1/general_audios.json?type=GeneralAudio&payment_required=true,'),headers: varHeader);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final data = jsonData['data'];
      final chantDownloadData = data.where((item) => item['type'] == 'Chant' && item['price_in_inr'] != '₹ 0').toList();
      // final chantData = data.where((item) => item['type'] == 'Chant').toList();
      setState(() {
        chantDownloadNames = chantDownloadData.map((item) => item['name']).toList();
      chantDownloadDuration = chantDownloadData.map((item) => item['duration']).toList();
      });
    }
  }
  Future fetchkriyaData() async {
    final response = await http.get(Uri.parse('https://dev.abhyaasa.com/v1/general_audios.json?type=GeneralAudio&payment_required=true,'),headers: varHeader);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final data = jsonData['data'];
      final kriyaData = data.where((item) => item['type'] == 'ArtExcel' && item['price_in_inr'] == '₹ 0').toList();
      // final kriyaData = data.where((item) => item['type'] == 'ArtExcel').toList();
      setState(() {
        kriyaNames = kriyaData.map((item) => item['name']).toList();
      kriyaDuration = kriyaData.map((item) => item['duration']).toList();
      });
    }
  }
  Future fetchDownloadkriyaData() async {
    final response = await http.get(Uri.parse('https://dev.abhyaasa.com/v1/general_audios.json?type=GeneralAudio&payment_required=true,'),headers: varHeader);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final data = jsonData['data'];
      final kriyaDownloadData = data.where((item) => item['type'] == 'ArtExcel' && item['price_in_inr'] != '₹ 0').toList();
      // final kriyaData = data.where((item) => item['type'] == 'ArtExcel').toList();
      setState(() {
        kriyaDownloadNames = kriyaDownloadData.map((item) => item['name']).toList();
      kriyaDownloadDuration = kriyaDownloadData.map((item) => item['duration']).toList();
      });
    }
  }
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
            title: const Text(
              "Add your playlist title",
              style: TextStyle(color: Colors.white54),
            ),
            centerTitle: true,
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 14),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: 
              Container(
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
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(85, 206, 236, 1),
            Color.fromRGBO(58, 155, 194, 1),
            Color.fromRGBO(36, 118, 168, 1),
            
            Color.fromRGBO(32, 109, 156, 1),
            Color.fromRGBO(15, 77, 146, 1.0)
          ],
        )
            ),
            // Asana tab
              child: SingleChildScrollView(
                child:
                    Container(
               height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,     
                             margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                      child: Column(
                        children:<Widget> [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text('On device and ready to play',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)),
                          
                             Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                    itemCount: asanaNames.length,
                                    itemBuilder: (context, index) {
                                      return 
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                              Padding(
                                padding: const EdgeInsets.only(top: 25,bottom: 3),
                                child: Text(asanaNames[index],style: TextStyle(color: const Color.fromARGB(255, 243, 240, 240),fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(asanaDuration[index],style: TextStyle(color: Colors.white60),),
                              ),
                              SizedBox(height: 10,),
                              Divider(height: 2, color: Colors.white,),
                              ],
                                            
                                      ),
                                      Icon(Icons.add_circle_outline_rounded,color: Colors.white,)
                                         ],
                                       );
                                    },
                                  ),
                            ),
                          SizedBox(height: 35,),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text('Download New Asanas',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)),
                          SizedBox(height: 20,),
                             Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                    itemCount: asanaDownloadNames.length,
                                    itemBuilder: (context, index) {
                                      return 
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                              Padding(
                                padding: const EdgeInsets.only(top: 25,bottom: 3),
                                child: Text(asanaDownloadNames[index],style: TextStyle(color: const Color.fromARGB(255, 243, 240, 240),fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(asanaDownloadDuration[index],style: TextStyle(color: Colors.white60),),
                              ),
                              Divider(height: 2, color: Colors.white,)
                              ],
                                            
                                      ),
                                      Icon(Icons.cloud_download,color: Colors.white,)
                                         ],
                                       );
                                    },
                                  ),
                            ),
                          
                        ],
                      ),
                          
                        
                      
                    ),
                 
                  
                
              ),
              
            
                
            

          ), 
          // Meditation Tab
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          colors: [
           Color.fromRGBO(85, 206, 236, 1),
            Color.fromRGBO(58, 155, 194, 1),
            Color.fromRGBO(36, 118, 168, 1),
            
            Color.fromRGBO(32, 109, 156, 1),
            Color.fromRGBO(15, 77, 146, 1.0)
          ],
        )
            ),
             child: SingleChildScrollView(
                child:
                    Container(
               height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,     
                             margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                      child: Column(
                        children:<Widget> [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text('On device and ready to play',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)),
                          
                             Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                    itemCount: meditationNames.length,
                                    itemBuilder: (context, index) {
                                      return 
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                              Padding(
                                padding: const EdgeInsets.only(top: 25,bottom: 3),
                                child: Text(meditationNames[index],style: TextStyle(color: const Color.fromARGB(255, 243, 240, 240),fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(meditationDuration[index],style: TextStyle(color: Colors.white60),),
                              ),
                              SizedBox(height: 10,),
                              Divider(height: 2, color: Colors.white,),
                              ],
                                            
                                      ),
                                      Icon(Icons.add_circle_outline_rounded,color: Colors.white,)
                                         ],
                                       );
                                    },
                                  ),
                            ),
                          SizedBox(height: 35,),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text('Download New Meditation',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)),
                          SizedBox(height: 20,),
                             Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                    itemCount: meditationDownloadNames.length,
                                    itemBuilder: (context, index) {
                                      return 
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                              Padding(
                                padding: const EdgeInsets.only(top: 25,bottom: 3),
                                child: Text(meditationDownloadNames[index],style: TextStyle(color: const Color.fromARGB(255, 243, 240, 240),fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(meditationDownloadDuration[index],style: TextStyle(color: Colors.white60),),
                              ),
                              Divider(height: 2, color: Colors.white,)
                              ],
                                            
                                      ),
                                      Icon(Icons.cloud_download,color: Colors.white,)
                                         ],
                                       );
                                    },
                                  ),
                            ),
                          
                        ],
                      ),
                          
                        
                      
                    ),
                 
                  
                
              ),
              
          ),
          // Chant Tab
          Container(
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
         begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          colors: [
           Color.fromRGBO(85, 206, 236, 1),
            Color.fromRGBO(58, 155, 194, 1),
            Color.fromRGBO(36, 118, 168, 1),
            
            Color.fromRGBO(32, 109, 156, 1),
            Color.fromRGBO(15, 77, 146, 1.0)
          ],
        )
            ),
           child: SingleChildScrollView(
                child:
                    Container(
               height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,     
                             margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                      child: Column(
                        children:<Widget> [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text('On device and ready to play',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)),
                          
                             Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                    itemCount: chantNames.length,
                                    itemBuilder: (context, index) {
                                      return 
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                              Padding(
                                padding: const EdgeInsets.only(top: 25,bottom: 3),
                                child: Text(chantNames[index],style: TextStyle(color: const Color.fromARGB(255, 243, 240, 240),fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(chantDuration[index],style: TextStyle(color: Colors.white60),),
                              ),
                              SizedBox(height: 10,),
                              Divider(height: 2, color: Colors.white,),
                              ],
                                            
                                      ),
                                      Icon(Icons.add_circle_outline_rounded,color: Colors.white,)
                                         ],
                                       );
                                    },
                                  ),
                            ),
                          SizedBox(height: 35,),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text('Download New Chants',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)),
                          SizedBox(height: 20,),
                             Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                    itemCount: chantDownloadNames.length,
                                    itemBuilder: (context, index) {
                                      return 
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                              Padding(
                                padding: const EdgeInsets.only(top: 25,bottom: 3),
                                child: Text(chantDownloadNames[index],style: TextStyle(color: const Color.fromARGB(255, 243, 240, 240),fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(chantDownloadDuration[index],style: TextStyle(color: Colors.white60),),
                              ),
                              Divider(height: 2, color: Colors.white,)
                              ],
                                            
                                      ),
                                      Icon(Icons.cloud_download,color: Colors.white,)
                                         ],
                                       );
                                    },
                                  ),
                            ),
                          
                        ],
                      ),
                          
                        
                      
                    ),
                 
                  
                
              ),

          ),
          // Kriya Tab
          Container(
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(85, 206, 236, 1),
            Color.fromRGBO(58, 155, 194, 1),
            Color.fromRGBO(36, 118, 168, 1),
            
            Color.fromRGBO(32, 109, 156, 1),
            Color.fromRGBO(15, 77, 146, 1.0)
          ],
        )
            ),
            child: SingleChildScrollView(
                child:
                    Container(
               height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,     
                             margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                      child: Column(
                        children:<Widget> [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text('On device and ready to play',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)),
                          
                             Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                    itemCount: kriyaNames.length,
                                    itemBuilder: (context, index) {
                                      return 
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                              Padding(
                                padding: const EdgeInsets.only(top: 25,bottom: 3),
                                child: Text(kriyaNames[index],style: TextStyle(color: const Color.fromARGB(255, 243, 240, 240),fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(kriyaDuration[index],style: TextStyle(color: Colors.white60),),
                              ),
                              SizedBox(height: 10,),
                              Divider(height: 2, color: Colors.white,),
                              ],
                                            
                                      ),
                                      Icon(Icons.add_circle_outline_rounded,color: Colors.white,)

                                         ],
                                       );
                                    },
                                  ),
                            ),
                          SizedBox(height: 35,),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text('Download New Kriyas',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)),
                          SizedBox(height: 20,),
                             Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                    itemCount: kriyaDownloadNames.length,
                                    itemBuilder: (context, index) {
                                      return 
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                              Padding(
                                padding: const EdgeInsets.only(top: 25,bottom: 3),
                                child: Text(kriyaDownloadNames[index],style: TextStyle(color: const Color.fromARGB(255, 243, 240, 240),fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(kriyaDownloadDuration[index],style: TextStyle(color: Colors.white60),),
                              ),
                              Divider(height: 2, color: Colors.white,)
                              ],
                                            
                                      ),
                                      Icon(Icons.cloud_download,color: Colors.white,)
                                         ],
                                       );
                                    },
                                  ),
                            ),
                          
                        ],
                      ),
                          
                        
                      
                    ),
                 
                  
                
              ),

          )
        ]
        ),

      ),
    );
    
  }
  // Widget songsListView(){
  //   // return FutureBuilder<List<SongModel>(
  //   return FutureBuilder<List>(
  //     future: _audioQuery.querySongs(
  //       sortType: SongSortType.DATE_ADDED,
  //       orderType: OrderType.DESC_OR_GREATER,
  //       uriType: UriType.EXTERNAL,
  //       ignoreCase: true,
  //     ),
  //     builder: (context,item){
  //       if(item.data == null){
  //         return Center(child: CircularProgressIndicator(),);
  //       }else if(item.data!.isEmpty){
  //             return Center(child: Text("No songs Found!!",style: TextStyle(color: Colors.white),),);
  //       }
  //       List songs = item.data!;
  //       // List<SongModel> songs = item.data!;
  //       return ListView.builder(
  //         itemCount: songs.length,
  //         itemBuilder: (context,index){
  //           //  return Text(songs.elementAt(index).displayName,style: TextStyle(color: Colors.white),)
  //           return Container(
  //             margin: EdgeInsets.only(top: 10,left: 15,right: 15),
  //             padding: EdgeInsets.only(top: 20,bottom: 20,right: 10,left: 10),
  //             decoration: BoxDecoration(
  //               border: Border(bottom: BorderSide(color: Colors.white))
  //             ),
  //             child:Text('Concentration_Pranayam_English',style: TextStyle(color: Colors.white70),) ,
  //           );
  //         });
  //     });
  // }
}
     //  MeditationListScreen(),
                  //  dummyPlaylist('Sanyam',  '30.18 mins', (){
                  //     setState(() {
                  //             isSanyam = !isSanyam; 
                  //           });
                  //   }, Icon(isSanyam ? Icons.add_circle : Icons.check,color: Colors.white,)),   
                  //   dummyPlaylist('Bogar Nadishodhan', '7.2 mins', (){
                  //     setState(() {
                  //             isBogar = !isBogar;
                  //           });
                  //   }, Icon(isBogar ? Icons.add_circle : Icons.check,color: Colors.white,)),
                  //   dummyPlaylist('Shanti Mantra', '2 mins', (){
                  //     setState(() {
                  //             isShantimantra = !isShantimantra;
                  //           });
                  //   }, Icon(isShantimantra ? Icons.add_circle : Icons.check,color: Colors.white,)),
                  //   dummyPlaylist('Warmup Stretches Hindi', '10.3 mins', (){
                  //     setState(() {
                  //             isWarmh = !isWarmh;
                  //           });
                  //   }, Icon(isWarmh ? Icons.add_circle : Icons.check,color: Colors.white,)),
                  //   dummyPlaylist('Warmup Stretches English', '10.3 mins', (){
                  //     setState(() {
                  //             isWarmE = !isWarmE;
                  //           });
                  //   }, Icon(isWarmE ? Icons.add_circle : Icons.check,color: Colors.white,)),
                  //   dummyPlaylist('Suryaa Namaskar', '4 mins', (){
                  //     setState(() {
                  //             isSurya = !isSurya;
                  //           });
                  //   }, Icon(isSurya ? Icons.add_circle : Icons.check,color: Colors.white,)),
                  //   dummyPlaylist('Padma Sadhana', '32.67 mins', (){
                  //     setState(() {
                  //             ispadma = !ispadma;
                  //           });
                  //   }, Icon(ispadma ? Icons.add_circle : Icons.check,color: Colors.white,)),