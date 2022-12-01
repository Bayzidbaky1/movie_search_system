import 'package:flutter/material.dart';

import '../model/movie_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModel> display_list = List.from(main_movie_list);
  static List<MovieModel> main_movie_list = [
    MovieModel("The Shawshank Redemption", "1994", "9.2",
        "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg"),
    MovieModel("The Godfather", "1972", "9.3",
        "https://m.media-amazon.com/images/M/MV5BMWMwMGQzZTItY2JlNC00OWZiLWIyMDctNDk2ZDQ2YjRjMWQ0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg"),
    MovieModel("The Dark Knight", "2008", "9.0",
        "https://images.squarespace-cdn.com/content/v1/5fc28a8d8fbfcf634c11b69c/1612823532797-R575JX5GED8FR6AHXYCW/91KkWf50SoL._SL1500_.jpg?format=1000w"),
    MovieModel("The Godfather Part II", "1974", "9.4",
        "https://flxt.tmsimg.com/assets/p6319_p_v8_bc.jpg"),
    MovieModel(
        "12 Angry Men",
        "1957",
        "9.0",
        "https://upload.wikimedia.org/wikipedia/commons/b/b5/12_Angry_Men_"
            "%281957_film_poster%29.jpg"),
    MovieModel("Schindler's List", "1994", "9.5",
        "https://m.media-amazon.com/images/M/MV5BODMxOTg4MzU1N15BMl5BanBnXkFtZTgwNDQ0MjMxMDE@._V1_.jpg"),
    MovieModel("The Godfather", "1972", "9.3",
        "https://m.media-amazon.com/images/M/MV5BMWMwMGQzZTItY2JlNC00OWZiLWIyMDctNDk2ZDQ2YjRjMWQ0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg"),
    MovieModel(
        "The Return of the King",
        "2003",
        "8.9",
        "https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY"
            "3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg"),
    MovieModel("The Godfather", "1972", "9.3",
        "https://m.media-amazon.com/images/M/MV5BMWMwMGQzZTItY2JlNC00OWZiLWIyMDctNDk2ZDQ2YjRjMWQ0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg"),
    MovieModel("Pulp Fiction", "1994", "8.8",
        "https://m.media-amazon.com/images/M/MV5BODMxOTg4MzU1N15BMl5BanBnXkFtZTgwNDQ0MjMxMDE@._V1_.jpg")
  ];

  void updateList(String value) {
    setState(() {
      display_list = main_movie_list
          .where((element) =>
              element.movie_title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f1454),
      appBar: AppBar(
        title: Center(
            child: Text(
          "Movies Apps",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
        )),
        backgroundColor: Color(0xFF1f1545),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for a Movie",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff302360),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg: The Dark Knight",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.purple.shade900,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: display_list.length == 0
                  ? Center(
                      child: Text(
                        "No result Found",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: display_list.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        title: Text(
                          display_list[index].movie_title!,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${display_list[index].movie_release_year!}",
                          style: TextStyle(color: Colors.white60),
                        ),
                        trailing: Text(
                          "${display_list[index].rating!}",
                          style: TextStyle(color: Colors.amber),
                        ),
                        leading: Image.network(
                            display_list[index].movie_poster_url!),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
