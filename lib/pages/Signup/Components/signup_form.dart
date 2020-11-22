import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:programathon_tuercas_2020/blocs/signupCubit/sign_up_cubit.dart';
import 'package:programathon_tuercas_2020/widgets/default_button.dart';
import 'package:programathon_tuercas_2020/widgets/text_fiield.dart';
import 'package:formz/formz.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<SignUpCubit, SignUpState>(
          buildWhen: (previous, current) =>
              previous.userName != current.userName,
          builder: (context, state) {
            return TextFieldCustom(
              label: 'Nombre Completo',
              errorOccurred: state.userName.invalid,
              erroMessage: 'Solo usar letras',
              hintText: 'Ingrese su nombre con apellidos',
              inputType: TextInputType.text,
              icon: FontAwesomeIcons.solidUser,
              onChanged: (value) =>
                  context.read<SignUpCubit>().userNameChanged(value),
            );
          },
        ),
        SizedBox(height: 30),
        BlocBuilder<SignUpCubit, SignUpState>(
          buildWhen: (previous, current) => previous.phone != current.phone,
          builder: (context, state) {
            return TextFieldCustom(
              label: 'Telefono',
              errorOccurred: state.phone.invalid,
              erroMessage: 'Numero de telefono no valido',
              hintText: 'Ingrese su numero de telefono',
              inputType: TextInputType.phone,
              icon: FontAwesomeIcons.phone,
              onChanged: (value) =>
                  context.read<SignUpCubit>().phoneChanged(value),
            );
          },
        ),
        SizedBox(height: 30),
        BlocBuilder<SignUpCubit, SignUpState>(
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
                  context.read<SignUpCubit>().emailChanged(value),
            );
          },
        ),
        SizedBox(height: 30),
        BlocBuilder<SignUpCubit, SignUpState>(
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
                  context.read<SignUpCubit>().passwordChanged(value),
            );
          },
        ),
        SizedBox(height: 20),
        BlocBuilder<SignUpCubit, SignUpState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, state) {
            return state.status.isSubmissionInProgress
                ? LinearProgressIndicator()
                : DefaultButton(
                    text: "Continue",
                    press: state.status.isValidated
                        ? () =>
                            context.read<SignUpCubit>().signUpFormSubmitted()
                        : null,
                  );
          },
        ),
      ],
    );
  }
}
