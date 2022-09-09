import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieDetail extends StatelessWidget{
  late final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);
  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          title: Text(movie.title),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Image.network(path, scale: 3),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        movie.title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Text('Ratings : '),
                                ),
                                Container(
                                  child: Text(movie.voteAverage.toString()),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Container(
                                  child: Text('Release date : '),
                                ),
                                Container(
                                  child: Text(movie.releaseDate),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        movie.overview,
                        //style: TextStyle(fontSize: 15),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
  
}