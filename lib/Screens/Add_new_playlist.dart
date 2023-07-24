import 'package:abhyasa/Widgets/reusable.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AddNewPlaylist extends StatefulWidget {
  const AddNewPlaylist({super.key});

  @override
  State<AddNewPlaylist> createState() => _AddNewPlaylistState();
}

class _AddNewPlaylistState extends State<AddNewPlaylist> {
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


  TabController? _controller;
  // final OnAudioQuery _audioQuery = OnAudioQuery();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // requestStoragePermission();
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
            child:  SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 25,),
                   Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text('On device & ready to play', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),textAlign: TextAlign.left,),
                    ),
                    // SizedBox(height: 20,),
                     
                   dummyPlaylist('Sanyam',  '30.18 mins', (){
                      setState(() {
                              isSanyam = !isSanyam;
                            });
                    }, Icon(isSanyam ? Icons.add_circle : Icons.check,color: Colors.white,)),   
                    dummyPlaylist('Bogar Nadishodhan', '7.2 mins', (){
                      setState(() {
                              isBogar = !isBogar;
                            });
                    }, Icon(isBogar ? Icons.add_circle : Icons.check,color: Colors.white,)),
                    dummyPlaylist('Shanti Mantra', '2 mins', (){
                      setState(() {
                              isShantimantra = !isShantimantra;
                            });
                    }, Icon(isShantimantra ? Icons.add_circle : Icons.check,color: Colors.white,)),
                    dummyPlaylist('Warmup Stretches Hindi', '10.3 mins', (){
                      setState(() {
                              isWarmh = !isWarmh;
                            });
                    }, Icon(isWarmh ? Icons.add_circle : Icons.check,color: Colors.white,)),
                    dummyPlaylist('Warmup Stretches English', '10.3 mins', (){
                      setState(() {
                              isWarmE = !isWarmE;
                            });
                    }, Icon(isWarmE ? Icons.add_circle : Icons.check,color: Colors.white,)),
                    dummyPlaylist('Suryaa Namaskar', '4 mins', (){
                      setState(() {
                              isSurya = !isSurya;
                            });
                    }, Icon(isSurya ? Icons.add_circle : Icons.check,color: Colors.white,)),
                    dummyPlaylist('Padma Sadhana', '32.67 mins', (){
                      setState(() {
                              ispadma = !ispadma;
                            });
                    }, Icon(ispadma ? Icons.add_circle : Icons.check,color: Colors.white,)),
            
                ],
              ),
            ),

          ),
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
            child:  SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 25,),
                   Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text('On device & ready to play', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),textAlign: TextAlign.left,),
                    ),
                    // SizedBox(height: 20,),
                     
                   dummyPlaylist('Concentration_Pranayam_English',  '3.57 mins', (){
                      setState(() {
                              isConcentration = !isConcentration;
                            });
                    }, Icon(isConcentration ? Icons.add_circle : Icons.check,color: Colors.white,)),   
                    dummyPlaylist('Hari Om', '22.67 mins', (){
                      setState(() {
                              isHariom = !isHariom;
                            });
                    }, Icon(isHariom ? Icons.add_circle : Icons.check,color: Colors.white,)),
                    dummyPlaylist('Panchakosha', '16.93 mins', (){
                      setState(() {
                              isPanchakosha = !isPanchakosha;
                            });
                    }, Icon(isPanchakosha ? Icons.add_circle : Icons.check,color: Colors.white,)),
                    dummyPlaylist('Silence', '10 mins', (){
                      setState(() {
                              isSilence = !isSilence;
                            });
                    }, Icon(isSilence ? Icons.add_circle : Icons.check,color: Colors.white,)),
                    SizedBox(height: 20,),
            Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text('Download new Meditation', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),textAlign: TextAlign.left,),
                    ),
                    dummyPlaylist('Amanercer_del_Ser_Spanish', '15.68 mins', (){
                      setState(() {
                              isAmanercer = !isAmanercer;
                            });
                    }, Icon(isAmanercer ? Icons.cloud_download : Icons.check,color: Colors.white,)),
                    dummyPlaylist('Atomo Molecula y Vida', '19.53 mins', (){
                      setState(() {
                              isAtomo = !isAtomo;
                            });
                    }, Icon(isAtomo ? Icons.cloud_download : Icons.check,color: Colors.white,)),
                    dummyPlaylist('AuraMeditation', '27.33 mins', (){
                      setState(() {
                              isAura = !isAura;
                            });
                    }, Icon(isAura ? Icons.cloud_download : Icons.check,color: Colors.white,)),
                    dummyPlaylist('Back to the source', '6.8 mins', (){
                      setState(() {
                              isBacktosource = !isBacktosource;
                            });
                    }, Icon(isBacktosource ? Icons.cloud_download : Icons.check,color: Colors.white,)),
                    
                ],
              ),
            ),

          ),
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

          ),
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
