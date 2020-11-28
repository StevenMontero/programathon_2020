import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:programathon_tuercas_2020/blocs/HomeBloc/home_bloc.dart';
import 'package:programathon_tuercas_2020/blocs/PastListBloc/postlist_bloc.dart';
import 'package:programathon_tuercas_2020/pages/Home/dumydata/country_model.dart';
import 'package:programathon_tuercas_2020/pages/Home/dumydata/data.dart';
import 'package:programathon_tuercas_2020/pages/Home/search_delegate.dart';
import 'package:programathon_tuercas_2020/repositories/DB/publication_repository.dart';
import 'package:programathon_tuercas_2020/widgets/card_popular_turs.dart';
import 'package:programathon_tuercas_2020/widgets/drawer_custom.dart';
import 'package:programathon_tuercas_2020/widgets/province_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProvinceModel> province = new List();
  @override
  void initState() {
    province = getProvince();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/palmera.svg",
              height: 28,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              "Turicu",
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: [
          Container(
              child: MaterialButton(
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
            shape: CircleBorder(),
            child: Icon(
              FontAwesomeIcons.search,
              size: 20,
            ),
          ))
        ],
        elevation: 0.0,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                HomeBloc(PublicatonRepository())..add(PostFetched()),
          ),
        ],
        child: Body(province: province),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    Key key,
    @required this.province,
  }) : super(key: key);

  final List<ProvinceModel> province;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  HomeBloc _cubit;
  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<HomeBloc>(context);
  }

  Future<void> _fetchNewPosts() async {
    context.read<HomeBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _fetchNewPosts,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Los mejores lugares y tours",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Provincias",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 220,
                child: ListView.builder(
                    itemCount: widget.province.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ProvinceCard(
                        onPress: () {
                          Navigator.of(context).pushNamed('listpost',
                              arguments: widget.province[index].provinceName);
                        },
                        label: widget.province[index].label,
                        provinceName: widget.province[index].provinceName,
                        noOfTours: widget.province[index].noOfTours,
                        imgUrl: widget.province[index].imgUrl,
                      );
                    }),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Tours",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 16,
              ),
              BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                if (state is PostInitial) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is PostFailure) {
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
                if (state is PostSuccess) {
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
              }),
            ],
          ),
        ),
      ),
    );
  }
}
