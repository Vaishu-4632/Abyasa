import 'package:abhyasa/Screens/NavBar.dart';
import 'package:abhyasa/Widgets/reusable.dart';
import 'package:flutter/material.dart';

class Intro2 extends StatefulWidget {
  const Intro2({super.key});

  @override
  State<Intro2> createState() => _Intro2State();
}

class _Intro2State extends State<Intro2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          
          decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.topRight,colors: [
              
              
                               
                   Color.fromRGBO(211, 181, 202, 0.938),
                                Color.fromRGBO(198, 178, 211, 1),
                                Color.fromRGBO(189, 156, 211, 1),
                                      Color.fromRGBO(148, 111, 173, 1),
             
               
            ],)
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.centerLeft,end: Alignment.centerRight,colors: [
              
                   Color.fromRGBO(211, 181, 202, 0.938),
                                Color.fromRGBO(198, 178, 211, 1),
                                Color.fromRGBO(189, 156, 211, 1),
                                      Color.fromRGBO(148, 111, 173, 1),
             
               
            ],)
        ),
         child:  SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              titleText('Calm'),
              
              const SizedBox(
                height: 10,
              ),
              subText('Sudarshan Kriya'),
              
              const SizedBox(
                height: 100,
              ),
              playButton((){}),
              const SizedBox(height: 50,),
              const Text('37 min', style: TextStyle(color: Colors.white),)
            ],

          ),
        ),
      ),
   
    );
  }
}