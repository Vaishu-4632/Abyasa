import 'package:abhyasa/Screens/Add_new_playlist.dart';
import 'package:abhyasa/Screens/IntroScreen.dart';
import 'package:abhyasa/Screens/New_playlist.dart';
import 'package:abhyasa/Screens/PlaylisPage.dart';
import 'package:abhyasa/Widgets/reusable.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:  <Widget>[
          const DrawerHeader(
           margin: EdgeInsets.only(bottom: 0),
            decoration: BoxDecoration(color:  Color.fromARGB(255, 34, 144, 163),),
            child: Row(
              children: [
                CircleAvatar(
                  maxRadius: 40,
                  backgroundColor: Colors.white24,
                  // backgroundImage: AssetImage('assets/Images/account_person.png',),
                  // foregroundColor: Colors.white,

                ),
                SizedBox(width: 15,),
                Text('Vaishnavi', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)
              ],
            ),

          ),
         
                 Container(
                  margin: EdgeInsets.only(top: 0),
                  height: 565,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [ Color.fromRGBO(13, 152, 186, 1.0),
            Color.fromRGBO(0, 135, 189, 1.0), Color.fromRGBO(0, 103, 165, 1.0),])
                        // color:  Color.fromARGB(255, 28, 153, 211),
                      ),
                   child: Column(
                     children: [
                       list(Icons.home, "Home" , (){
                        Navigator.of(context).push(
                             MaterialPageRoute(
                               builder: (context) => const IntroScreen()),);
                               
                              }),
                               list(Icons.add_circle, 'New Playlist', 
          (){ Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const NewPlaylist(),),);}
         ),
         list(Icons.home, "All Playlist" , (){
                        Navigator.of(context).push(
                             MaterialPageRoute(
                               builder: (context) =>  PlaylistScreen()),);
                               
                              }),

                     ],
                   ),
                 ),
        //  list(Icons.add_a_photo, 'New Playlist', 
        //   (){ Navigator.of(context).push(
        // MaterialPageRoute(
        //   builder: (context) => const AddNewPlaylist(),),);}
        //  )
                
              

        

        ],
      ),
    );
  }
}