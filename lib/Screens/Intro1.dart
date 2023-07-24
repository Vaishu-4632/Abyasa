import 'package:abhyasa/Screens/NavBar.dart';
import 'package:abhyasa/Widgets/reusable.dart';
import 'package:flutter/material.dart';

class Intro1 extends StatefulWidget {
  const Intro1({super.key});

  @override
  State<Intro1> createState() => _Intro1State();
}

class _Intro1State extends State<Intro1> {
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
              playButton((){}),
             
              SizedBox(height: 50,),
              Text('4 min', style: TextStyle(color: Colors.white),)
            ],

          ),
        ),
      ),
      
    );
  }
}
