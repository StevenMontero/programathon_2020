import 'package:formz/formz.dart';

enum NumberValidationError { invalid }

class Number extends FormzInput<String, NumberValidationError> {
  const Number.pure() : super.pure('');
  const Number.dirty([String value = '']) : super.dirty(value);

  static final _numberRegExp = RegExp(r'^[0-9]{1,}$');

  @override
  NumberValidationError validator(String value) {
    return _numberRegExp.hasMatch(value) ? null : NumberValidationError.invalid;
  }
}
