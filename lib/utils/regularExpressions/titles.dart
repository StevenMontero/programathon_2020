import 'package:formz/formz.dart';

enum TitlesValidationError { invalid }

class TitlesValidator extends FormzInput<String, TitlesValidationError> {
  const TitlesValidator.pure() : super.pure('');
  const TitlesValidator.dirty([String value = '']) : super.dirty(value);

  static final _userNameRegExp = RegExp(r'[a-zA-Z]{1,40}$');

  @override
  TitlesValidationError validator(String value) {
    return _userNameRegExp.hasMatch(value)
        ? null
        : TitlesValidationError.invalid;
  }
}
