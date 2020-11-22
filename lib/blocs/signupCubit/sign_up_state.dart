part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.userName = const UserName.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.phone = const NumberPhone.pure(),
    this.status = FormzStatus.pure,
  });

  final Email email;
  final Password password;
  final FormzStatus status;
  final UserName userName;
  final NumberPhone phone;

  @override
  List<Object> get props => [email, password, userName, phone, status];

  SignUpState copyWith({
    Email email,
    Password password,
    UserName userName,
    NumberPhone phone,
    FormzStatus status,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      userName: userName ?? this.userName,
      phone: phone ?? this.phone,
      status: status ?? this.status,
    );
  }
}
