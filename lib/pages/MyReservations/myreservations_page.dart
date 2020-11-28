import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:programathon_tuercas_2020/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:programathon_tuercas_2020/blocs/MyReservationBloc/myreservation_bloc.dart';
import 'package:programathon_tuercas_2020/repositories/DB/reservation_repository.dart';
import 'package:programathon_tuercas_2020/widgets/reservation_card.dart';

class MyReservationPage extends StatelessWidget {
  const MyReservationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<AuthenticationBloc>(context).state.user.name;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Reservaciones'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushNamed('home'),
        ),
      ),
      body: BlocProvider(
        create: (context) => MyReservationBloc(ReservationRepository())
          ..add(MyReservationFetched(userName: user)),
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
                "Mis Reservaciones",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<MyReservationBloc, MyReservationState>(
                builder: (context, state) {
                  if (state is MyReservationInitial) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is MyReservationFailure) {
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
                  if (state is MyReservationSuccess) {
                    if (state.reservation.isEmpty) {
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
                        itemCount: state.reservation.length,
                        itemBuilder: (context, index) {
                          return FutureBuilder(
                            future: state.reservation[index].publication
                                .getImages(),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<String>> snapshot) {
                              if (snapshot.hasData)
                                return ReservationCard(
                                  imageURl: snapshot.data[0],
                                  reservation: state.reservation[index],
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
