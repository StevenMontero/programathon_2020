import 'package:authentication_repository/authentication_repository.dart';
import 'package:formz/formz.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:programathon_tuercas_2020/Models/user_profile.dart';
import 'package:programathon_tuercas_2020/repositories/DB/user_repository.dart';
import 'package:programathon_tuercas_2020/utils/regularExpressions/regular_expressions_models.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authenticationRepository)
      : assert(_authenticationRepository != null),
        super(const SignUpState());

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository = new UserRepository();
  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status:
          Formz.validate([email, state.password, state.userName, state.phone]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status:
          Formz.validate([state.email, password, state.userName, state.phone]),
    ));
  }

  //valida el campo de texto del nombre de usuario.
  void userNameChanged(String value) {
    final userName = UserName.dirty(value);
    emit(state.copyWith(
      userName: userName,
      status:
          Formz.validate([state.email, state.password, userName, state.phone]),
    ));
  }

  //validad el campo de texto del telefono
  void phoneChanged(String value) {
    final phone = NumberPhone.dirty(value);
    emit(state.copyWith(
      phone: phone,
      status:
          Formz.validate([state.email, state.password, state.userName, phone]),
    ));
  }

  Future<void> signUpFormSubmitted() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.signUp(
        email: state.email.value,
        password: state.password.value,
      );
      final userLoged = await _authenticationRepository.user.last;
      _userRepository.addNewUser(new UserProfile(
          userName: state.userName.value,
          email: state.email.value,
          id: userLoged.id,
          phone: state.phone.value));
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
