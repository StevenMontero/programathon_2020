import 'package:formz/formz.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

enum ListValidationError { invalid }

class ListValidator extends FormzInput<List<Asset>, ListValidationError> {
  const ListValidator.pure() : super.pure(const []);
  const ListValidator.dirty([List<Asset> value = const []])
      : super.dirty(value);
  @override
  ListValidationError validator(List<Asset> value) {
    return value.length > 0 ? null : ListValidationError.invalid;
  }
}
