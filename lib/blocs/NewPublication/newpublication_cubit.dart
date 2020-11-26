import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:programathon_tuercas_2020/Models/address.dart';
import 'package:programathon_tuercas_2020/Models/publication.dart';
import 'package:programathon_tuercas_2020/Models/user_profile.dart';
import 'package:programathon_tuercas_2020/repositories/DB/publication_repository.dart';
import 'package:programathon_tuercas_2020/utils/regularExpressions/emty_list.dart';
import 'package:programathon_tuercas_2020/utils/regularExpressions/numbers.dart';
import 'package:programathon_tuercas_2020/utils/regularExpressions/text.dart';
import 'package:programathon_tuercas_2020/utils/regularExpressions/text_numbers.dart';
import 'package:programathon_tuercas_2020/utils/regularExpressions/titles.dart';

part 'newpublication_state.dart';

class NewpublicationCubit extends Cubit<PublicationFormnState> {
  final PublicatonRepository _publicatonRepository;

  NewpublicationCubit(this._publicatonRepository)
      : assert(_publicatonRepository != null),
        super(PublicationFormnState(extras: new List<String>()));

  void _summitFromPublication() {
    final address = new Address(
        province: state.province.value,
        canton: state.canton.value,
        district: state.description.value,
        details: state.addressDetails.value);
    final user = new Publication(
      address: address,
      datePublication: DateTime.now(),
      description: state.description.value,
      extras: state.extras,
    );
  }

  void titleChanged(String value) {
    final title = TitlesValidator.dirty(value);
    emit(state.copyWith(
      title: title,
      status: Formz.validate([
        title,
        state.addressDetails,
        state.canton,
        state.description,
        state.districs,
        state.photos,
        state.price,
        state.province,
        state.quotes
      ]),
    ));
  }

  void priceChanged(String value) {
    final price = Number.dirty(value);
    emit(state.copyWith(
      price: price,
      status: Formz.validate([
        state.title,
        state.addressDetails,
        state.canton,
        state.description,
        state.districs,
        state.photos,
        price,
        state.province,
        state.quotes
      ]),
    ));
  }

  void quotesChanged(String value) {
    final quotes = Number.dirty(value);
    emit(state.copyWith(
      quotes: quotes,
      status: Formz.validate([
        state.title,
        state.addressDetails,
        state.canton,
        state.description,
        state.districs,
        state.photos,
        state.price,
        state.province,
        quotes
      ]),
    ));
  }

  void provinceChanged(String value) {
    final province = TextValidator.dirty(value);
    emit(state.copyWith(
      province: province,
      status: Formz.validate([
        state.title,
        state.addressDetails,
        state.canton,
        state.description,
        state.districs,
        state.photos,
        state.price,
        province,
        state.quotes
      ]),
    ));
  }

  void cantonChanged(String value) {
    final canton = TextValidator.dirty(value);
    emit(state.copyWith(
      canton: canton,
      status: Formz.validate([
        state.title,
        state.addressDetails,
        canton,
        state.description,
        state.districs,
        state.photos,
        state.price,
        state.province,
        state.quotes
      ]),
    ));
  }

  void districsChanged(String value) {
    final districs = TextValidator.dirty(value);
    emit(state.copyWith(
      districs: districs,
      status: Formz.validate([
        state.title,
        state.addressDetails,
        state.canton,
        state.description,
        districs,
        state.photos,
        state.price,
        state.province,
        state.quotes
      ]),
    ));
  }

  void addressDetailsChanged(String value) {
    final addressDetails = TextNumbersValidator.dirty(value);
    emit(state.copyWith(
      addressDetails: addressDetails,
      status: Formz.validate([
        state.title,
        addressDetails,
        state.canton,
        state.description,
        state.districs,
        state.photos,
        state.price,
        state.province,
        state.quotes
      ]),
    ));
  }

  void descriptionChanged(String value) {
    final description = TextNumbersValidator.dirty(value);
    emit(state.copyWith(
      description: description,
      status: Formz.validate([
        state.title,
        state.addressDetails,
        state.canton,
        description,
        state.districs,
        state.photos,
        state.price,
        state.province,
        state.quotes
      ]),
    ));
  }

  void photosAdded() async {
    final List<Asset> dummy = await _loadAssets();
    final photos = ListValidator.dirty(dummy);
    emit(state.copyWith(
      photos: photos,
      status: Formz.validate([
        state.title,
        state.addressDetails,
        state.canton,
        state.description,
        state.districs,
        photos,
        state.price,
        state.province,
        state.quotes
      ]),
    ));
  }

  void photosRemoved(Asset value) {
    final dummy = new List<Asset>();

    dummy.add(value);
    final List<Asset> newList = state.photos.value + dummy;
    newList
        .removeWhere((element) => element.getByteData() == value.getByteData());
    final photos = ListValidator.dirty(newList);

    emit(state.copyWith(
      photos: photos,
      status: Formz.validate([
        state.title,
        state.addressDetails,
        state.canton,
        state.description,
        state.districs,
        photos,
        state.price,
        state.province,
        state.quotes
      ]),
    ));
  }

  void extrasAdded(String value) {
    final dummy = new List<String>();
    dummy.add(value);
    final newList = state.extras + dummy;
    emit(state.copyWith(
      extras: newList,
      status: Formz.validate([
        state.title,
        state.addressDetails,
        state.canton,
        state.description,
        state.districs,
        state.photos,
        state.price,
        state.province,
        state.quotes
      ]),
    ));
  }

  void extrasRemoved(String value) {
    final dummy = new List<String>();
    dummy.add(value);
    final newList = state.extras + dummy;
    newList.removeWhere((e) => e == value);
    emit(state.copyWith(
      extras: newList,
      status: Formz.validate([
        state.title,
        state.addressDetails,
        state.canton,
        state.description,
        state.districs,
        state.photos,
        state.price,
        state.province,
        state.quotes
      ]),
    ));
  }

  Future<List<Asset>> _loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: state.photos.value,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Tours",
          allViewTitle: "Todas las fotos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    return resultList;
  }
}
