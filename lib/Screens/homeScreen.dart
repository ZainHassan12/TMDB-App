import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_app/Api/api.dart';
import 'package:tmdb_app/Model/movies_model.dart';
import 'package:tmdb_app/Screens/detailScreen.dart';
import 'package:tmdb_app/constants.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  late Future<List<Results>> trendingMovies;
  late Future<List<Results>> topRatedMovies;
  late Future<List<Results>> upComingMovies;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trendingMovies = Api().getTrending();
    topRatedMovies = Api().getTopRated();
    upComingMovies = Api().getUpcoming();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        elevation: 0,
        title: const Text(
            'Movie Flix',
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: screenWidth*0.03, top: screenHeight*0.01),
              child: Text('Trending Movies', style: GoogleFonts.aBeeZee(fontSize: screenWidth*0.065, fontWeight: FontWeight.bold),),
            ),

            SizedBox(
              height: screenHeight*0.02,
            ),

            SizedBox(
              width: double.infinity,
              child: FutureBuilder(
                future: trendingMovies,
                builder: (context, snapshot){
                  if(snapshot.hasError){
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }else if(snapshot.hasData){
                    return CarouselSlider.builder(
                      itemCount: snapshot.data!.length,
                      options: CarouselOptions(
                        height: screenHeight*0.35,
                        autoPlay: true,
                        viewportFraction: 0.55,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayAnimationDuration: const Duration(seconds: 2),
                        enlargeCenterPage: true,
                        pageSnapping: true,
                      ),
                      itemBuilder: (context, itemIndex, pageViewIndex){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>
                                Detailscreen(moviee: snapshot.data![itemIndex])
                                )
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              width: screenWidth*0.47,
                              child: Image.network(
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                                '${Constants.imgPath}/${snapshot.data![itemIndex].posterPath}'
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }else{
                    return const Center(child: CircularProgressIndicator(),);
                  }
                },
              ),
            ),

            SizedBox(
              height: screenHeight*0.02,
            ),

            Padding(
              padding: EdgeInsets.only(left: screenWidth*0.03),
              child: Text('Top Rated Movies', style: GoogleFonts.aBeeZee(fontSize: screenWidth*0.065, fontWeight: FontWeight.bold),),
            ),

            SizedBox(
              height: screenHeight*0.02,
            ),

            SizedBox(
              width: double.infinity,
              child: FutureBuilder(
                future: topRatedMovies,
                builder: (context, snapshot){
                  if(snapshot.hasError){
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }else if(snapshot.hasData){
                    return SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>
                                        Detailscreen(moviee: snapshot.data![index])
                                    )
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                  height: 200,
                                  width: 150,
                                  child: Image.network(
                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.cover,
                                      '${Constants.imgPath}/${snapshot.data![index].posterPath}'
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }else{
                    return const Center(child: CircularProgressIndicator(),);
                  }
                },
              ),
            ),

            SizedBox(
              height: screenHeight*0.02,
            ),

            Padding(
              padding: EdgeInsets.only(left: screenWidth*0.03),
              child: Text('Upcoming Movies', style: GoogleFonts.aBeeZee(fontSize: screenWidth*0.065, fontWeight: FontWeight.bold),),
            ),

            SizedBox(
              height: screenHeight*0.02,
            ),

            SizedBox(
              width: double.infinity,
              child: FutureBuilder(
                future: upComingMovies,
                builder: (context, snapshot){
                  if(snapshot.hasError){
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }else if(snapshot.hasData){
                    return SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>
                                        Detailscreen(moviee: snapshot.data![index])
                                    )
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                  height: 200,
                                  width: 150,
                                  child: Image.network(
                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.cover,
                                      '${Constants.imgPath}/${snapshot.data![index].posterPath}'
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }else{
                    return const Center(child: CircularProgressIndicator(),);
                  }
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
