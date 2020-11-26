import 'package:formz/formz.dart';

enum TextValidationError { invalid }

class TextValidator extends FormzInput<String, TextValidationError> {
  const TextValidator.pure() : super.pure('');
  const TextValidator.dirty([String value = '']) : super.dirty(value);

  static final _userNameRegExp = RegExp(r'[a-zA-Z]+$');

  @override
  TextValidationError validator(String value) {
    return _userNameRegExp.hasMatch(value) ? null : TextValidationError.invalid;
  }
}
