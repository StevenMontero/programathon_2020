import 'package:flutter/material.dart';
import 'package:programathon_tuercas_2020/Models/publication.dart';
import 'package:programathon_tuercas_2020/repositories/DB/publication_repository.dart';
import 'package:programathon_tuercas_2020/widgets/card_popular_turs.dart';

class DataSearch extends SearchDelegate {
  //final peliculas = ['Hola', 'Adios'];
  final peliculasRecientes = ['Spiderman', 'Capitan America'];
  final _repoPublication = new PublicatonRepository();

  @override
  List<Widget> buildActions(BuildContext context) {
    // las acciones de nuestro appbar
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // lo que aparece a la izquierda del app bar un icono por ejemplo
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    // crea los resultados que vamos a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Muestra las sujerencias a como vamos escribiendo
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: _repoPublication.searchPost(query),
      builder:
          (BuildContext context, AsyncSnapshot<List<Publication>> snapshot) {
        if (snapshot.hasData) {
          final posts = snapshot.data;
          return ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return FutureBuilder(
                  future: posts[index].getImages(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<String>> snapshot) {
                    if (snapshot.hasData)
                      return PopularToursCard(
                          imgUrl: snapshot.data[0], publication: posts[index]);
                    return Container();
                  },
                );
              });
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
