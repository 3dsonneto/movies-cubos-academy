import 'package:flutter/material.dart';
import 'package:movies_cubos/movie.dart';
import 'package:movies_cubos/movie_controller.dart';

class MovieView extends StatefulWidget {
  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  final controller = MovieController();

  @override
  Widget build(BuildContext context) {
    controller.loadMovies();
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFEA1863),
          title: Container(
            margin: EdgeInsets.only(left: 60, right: 60),
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 5, bottom: 5),
            decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.8),
                borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Text(
                "Lançamentos",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.3, 1],
                  colors: [Colors.black, Color(0xFFEA1863)])),
          alignment: Alignment.center,
          child: FutureBuilder<Movie>(
              future: controller.movie,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 50,
                    alignment: Alignment.center,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return Container(
                    margin: EdgeInsets.only(right: 30, left: 30, top: 10),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        itemCount: snapshot.data.results.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.only(top: 5, bottom: 30),
                              child: Stack(
                                children: [
                                  Container(
                                    child: Image.network(
                                        "https://image.tmdb.org/t/p/w400/${snapshot.data.results[index].posterPath}"),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(0, 0, 0, 0.7),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        snapshot
                                            .data.results[index].releaseDate,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(bottom: 10, top: 10),
                                      alignment: Alignment.center,
                                      color: Color.fromRGBO(0, 0, 0, 0.5),
                                      child: Text(
                                        snapshot.data.results[index].title,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ));
                        }),
                  );
                } else if (snapshot.hasError) {
                  return (Text(snapshot.error.toString()));
                } else {
                  return Text("Nenhum dado foi encontrado");
                }
              }),
        ),
      ),
    );
  }
}
