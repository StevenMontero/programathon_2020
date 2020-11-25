import 'package:formz/formz.dart';

enum TextNumbersValidationError { invalid }

class TextNumbersValidator
    extends FormzInput<String, TextNumbersValidationError> {
  const TextNumbersValidator.pure() : super.pure('');
  const TextNumbersValidator.dirty([String value = '']) : super.dirty(value);

  static final _userNameRegExp = RegExp(r'[A-Za-z0-9]\w+');

  @override
  TextNumbersValidationError validator(String value) {
    return _userNameRegExp.hasMatch(value)
        ? null
        : TextNumbersValidationError.invalid;
  }
}
