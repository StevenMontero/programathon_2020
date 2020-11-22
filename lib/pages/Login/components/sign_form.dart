import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:programathon_tuercas_2020/blocs/loginCubit/login_cubit.dart';
import 'package:programathon_tuercas_2020/widgets/default_button.dart';
import 'package:programathon_tuercas_2020/widgets/text_fiield.dart';
import 'package:formz/formz.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (previous, current) => previous.email != current.email,
          builder: (context, state) {
            return TextFieldCustom(
              label: 'Email',
              errorOccurred: state.email.invalid,
              erroMessage: 'Email no valido',
              hintText: 'Ingrese su email',
              inputType: TextInputType.emailAddress,
              icon: FontAwesomeIcons.solidEnvelope,
              onChanged: (value) =>
                  context.read<LoginCubit>().emailChanged(value),
            );
          },
        ),
        SizedBox(height: 30),
        BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (previous, current) =>
              previous.password != current.password,
          builder: (context, state) {
            return TextFieldCustom(
              label: 'Password',
              errorOccurred: state.password.invalid,
              erroMessage: 'Password no valido',
              hintText: 'Ingrese su password',
              inputType: TextInputType.text,
              icon: FontAwesomeIcons.lockOpen,
              isPassword: true,
              onChanged: (value) =>
                  context.read<LoginCubit>().passwordChanged(value),
            );
          },
        ),
        SizedBox(height: 20),
        BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, state) {
            return state.status.isSubmissionInProgress
                ? LinearProgressIndicator()
                : DefaultButton(
                    text: "Continue",
                    press: state.status.isValidated
                        ? () =>
                            context.read<LoginCubit>().logInWithCredentials()
                        : null,
                  );
          },
        ),
      ],
    );
  }
}
