import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:programathon_tuercas_2020/blocs/loginCubit/login_cubit.dart';
import 'package:programathon_tuercas_2020/size_config.dart';
import 'package:formz/formz.dart';
import 'package:programathon_tuercas_2020/theme/colors.dart';
import 'components/body.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => LoginCubit(context.read<AuthenticationRepository>()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Login",
            style:
                TextStyle(fontSize: 20.0, color: ColorsApp.primaryColorOrange),
          ),
        ),
        body: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status.isSubmissionFailure) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                      content: Text(
                    'Login Failure',
                  )),
                );
            }
          },
          child: Stack(children: [
            Positioned(
                top: -150,
                right: -130,
                child: Container(
                    width: 350,
                    height: 350,
                    child: SvgPicture.asset('assets/icons/dom_op.svg'))),
            Body()
          ]),
        ),
      ),
    );
  }
}
