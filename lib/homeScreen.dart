import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        elevation: 0,
        title: const Text('Movie Flix'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Trending Movies', style: GoogleFonts.aBeeZee(fontSize: screenWidth*0.065, fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: CarouselSlider.builder(
                  itemCount: 10,
                  options: CarouselOptions(
                    height: screenHeight*0.33,
                    autoPlay: true,
                    viewportFraction: 0.55,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                    enlargeCenterPage: true,
                    pageSnapping: true,
                  ),
                  itemBuilder: (context, itemIndex, pageViewIndex){
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        //height: 300,
                        width: screenWidth*0.47,
                        color: Colors.amber,
                      ),
                    );
                  },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text('Top Rated Movies', style: GoogleFonts.aBeeZee(fontSize: screenWidth*0.065, fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        color: Colors.amber,
                        height: 200,
                        width: 150,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text('Upcoming Movies', style: GoogleFonts.aBeeZee(fontSize: screenWidth*0.065, fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        color: Colors.amber,
                        height: 200,
                        width: 150,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
