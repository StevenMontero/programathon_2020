import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:programathon_tuercas_2020/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:programathon_tuercas_2020/blocs/MyPostBloc/mypost_bloc.dart';
import 'package:programathon_tuercas_2020/repositories/DB/publication_repository.dart';
import 'package:programathon_tuercas_2020/widgets/card_popular_turs.dart';

class MyPostPage extends StatelessWidget {
  const MyPostPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<AuthenticationBloc>(context).state.user.name;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Tours'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushNamed('home'),
        ),
      ),
      body: BlocProvider(
        create: (context) => MyPostBloc(PublicatonRepository())
          ..add(MyPostFetched(userName: user)),
        child: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Mis Publicaciones",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<MyPostBloc, MyPostState>(
                builder: (context, state) {
                  if (state is MyPostInitial) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is MyPostFailure) {
                    return Center(
                      child: Column(
                        children: [
                          Text('No se pudo cargar las publicaiones'),
                          SvgPicture.asset(
                              'assets/images/undraw_page_not_found_su7k.svg')
                        ],
                      ),
                    );
                  }
                  if (state is MyPostSuccess) {
                    if (state.posts.isEmpty) {
                      return Center(
                        child: Column(
                          children: [
                            Text('No hay publicaciones'),
                            SvgPicture.asset(
                                'assets/images/undraw_Taken_re_yn20.svg')
                          ],
                        ),
                      );
                    }

                    return ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: state.posts.length,
                        itemBuilder: (context, index) {
                          return FutureBuilder(
                            future: state.posts[index].getImages(),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<String>> snapshot) {
                              if (snapshot.hasData)
                                return PopularToursCard(
                                  imgUrl: snapshot.data[0],
                                  publication: state.posts[index],
                                );
                              return Container();
                            },
                          );
                        });
                  }
                  return Container();
                },
              )
            ])));
  }
}
