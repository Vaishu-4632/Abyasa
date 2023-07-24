 import 'dart:ui';

import 'package:flutter/material.dart';
// bool isPressed = false;

titleText(title_text) {
  return Text(
                title_text,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              );
}
subText(subtext){
  return Text(
                subtext,
                style: TextStyle(color: Colors.white),
              );
}
playButton(onPressed){
   return Stack(children: [
                const Icon(
                  Icons.circle,
                  color: Colors.white30,
                  size: 200,
                ),
                const Positioned(
                    top: 25,
                    left: 25,
                    child: Icon(
                      Icons.circle,
                      color: Colors.white60,
                      size: 150,
                    )),
                Positioned(
                  top: 33,
                  left: 35,
                    child: IconButton(

                  onPressed: onPressed, icon:  const Icon(Icons.play_arrow,
                  color: Colors.white,
                  size: 120,
                )))
              ]);
}

ListTile list(icon, text, onTap){
     return ListTile(
            leading: Icon(icon,color: Color.fromARGB(255, 119, 218, 208),size: 30),
            title: Text(text,style: TextStyle(color: Colors.white,fontSize: 18),),
            onTap: onTap,

          );
}
dummyPlaylist( text,durationText,onPressed,icon ){
  return Column(
              children: [
                // const SizedBox(height: 25,),
                
                  Container(
                    height: 80,
                    margin: const EdgeInsets.only(left: 30,right: 30),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.white60))
                    ),
                          
                    
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20,),
                             Container(alignment: Alignment.centerLeft,child: Text(text,style: TextStyle(color: Colors.white),)),
                            const SizedBox(height: 10,),
                            Container(alignment: Alignment.centerLeft ,child:  Text(durationText,style: TextStyle(color: Colors.white70),))
                          ],
                        ),
                        IconButton(onPressed: onPressed
                        , icon:icon
                         )
                      ],
                    ),
                  )
                  // songsListView(),
                
              ],
            );

}