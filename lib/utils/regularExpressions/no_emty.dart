import 'package:formz/formz.dart';

enum EmptyValidationError { invalid }

class EmptyValidator extends FormzInput<DateTime, EmptyValidationError> {
  const EmptyValidator.pure() : super.pure(null);
  const EmptyValidator.dirty([DateTime value]) : super.dirty(value);
  @override
  EmptyValidationError validator(DateTime value) {
    return value != null ? null : EmptyValidationError.invalid;
  }
}
