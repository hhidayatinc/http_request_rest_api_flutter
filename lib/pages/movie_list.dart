import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http_request_rest_api_flutter/service/http_service.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  String result = "";
  late HttpService service;

  @override
  void initState() {
    service = HttpService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    service.getPopularMovies().then((value) => {
          setState(() {
            result = value! as String;
          })
        });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies"),
      ),
      body: Container(
        child: Text(result),
      ),
    );
  }
}
