import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http_request_rest_api_flutter/pages/movie_detail.dart';
import 'package:http_request_rest_api_flutter/service/http_service.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late List movies;
  int? moviesCount;
  late HttpService service;

  Future initialize() async{
    movies = [];
    movies = (await service.getPopularMovies())!;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies"),
      ),
      body: ListView.builder(
        // ignore: unnecessary_null_comparison
        itemCount: (moviesCount??0),
        itemBuilder: (context, int position){
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: InkWell(
            child: Image.network('https://image.tmdb.org/t/p/w500/' +
                  movies[position].posterPath,fit: BoxFit.fill,),
                  
                onTap: (){
                  MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => MovieDetail(movies[position]));
                    Navigator.push(context, route);
                },  
          ),
          // child: ListTile(
          //   title: Text(movies[position].title),
          //   subtitle: Text(
          //     'Rating = ' + movies[position].voteAverage.toString()
          //   ),
          //   onTap: (){
          //     MaterialPageRoute route = MaterialPageRoute(builder: (_) => MovieDetail(movies[position]));
          //     Navigator.push(context, route);
          //   },
          // ),
        );
      })
    );
  }
}
