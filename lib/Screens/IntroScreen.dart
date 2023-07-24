import 'package:abhyasa/Screens/Intro1.dart';
import 'package:abhyasa/Screens/Intro2.dart';
import 'package:abhyasa/Screens/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final pageController = PageController();
  bool isLastPage = false;
  int currentPage = 0;
  List<Gradient> colors = [const LinearGradient(colors: [ Color.fromRGBO(13, 152, 186, 1.0),
                                Color.fromRGBO(0, 135, 189, 1.0),
                                Color.fromRGBO(0, 103, 165, 1.0),
                                Color.fromRGBO(15, 77, 146, 1.0)]), const LinearGradient(colors: [Color.fromRGBO(211, 181, 202, 0.938),
                                Color.fromRGBO(198, 178, 211, 1),
                                Color.fromRGBO(189, 156, 211, 1),
                                      Color.fromRGBO(148, 111, 173, 1),])];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: PageView(
        onPageChanged: (int page){
          setState(() {
             currentPage  = page; 
          });
        },
        controller: pageController,
        children: const [
           Intro1(),
          Intro2(),
        ],
        
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        height: 80,
        decoration:  BoxDecoration(
          gradient: colors[currentPage]
        ),

        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect:  const SlideEffect (
                      activeDotColor: Colors.white,
                       dotHeight: 8,
                       dotWidth: 8,
                      dotColor: Colors.grey,
                      spacing: 10),
                      onDotClicked: (index) => pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn),
                ),
                
                
              ),
              const SizedBox(height: 15,),
              const Center(
                child: Icon(Icons.settings, color: Colors.white,),
              )
            ],
          ),
        ),
      ),
     
      );
      
    
  }
}