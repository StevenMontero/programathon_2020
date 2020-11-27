import 'package:formz/formz.dart';

enum EmptyValidationError { invalid }

class EmptyDateValidator extends FormzInput<DateTime, EmptyValidationError> {
  const EmptyDateValidator.pure() : super.pure(null);
  const EmptyDateValidator.dirty([DateTime value]) : super.dirty(value);
  @override
  EmptyValidationError validator(DateTime value) {
    return value != null ? null : EmptyValidationError.invalid;
  }
}
