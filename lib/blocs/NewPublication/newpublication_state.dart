part of 'newpublication_cubit.dart';

class PublicationFormnState extends Equatable {
  final TitlesValidator title;
  final Number price;
  final Number quotes;
  final TextValidator province;
  final TextValidator canton;
  final TextValidator districs;
  final TextNumbersValidator addressDetails;
  final TextNumbersValidator description;
  final List<String> extras;
  final ListValidator photos;
  final FormzStatus status;
  const PublicationFormnState({
    this.title = const TitlesValidator.pure(),
    this.price = const Number.pure(),
    this.quotes = const Number.pure(),
    this.province = const TextValidator.pure(),
    this.canton = const TextValidator.pure(),
    this.districs = const TextValidator.pure(),
    this.addressDetails = const TextNumbersValidator.pure(),
    this.description = const TextNumbersValidator.pure(),
    this.extras = const [],
    this.photos = const ListValidator.pure(),
    this.status = FormzStatus.pure,
  });

  PublicationFormnState copyWith({
    TitlesValidator title,
    Number price,
    Number quotes,
    TextValidator province,
    TextValidator canton,
    TextValidator districs,
    TextNumbersValidator addressDetails,
    TextNumbersValidator description,
    List<String> extras,
    ListValidator photos,
    FormzStatus status,
  }) {
    return PublicationFormnState(
      title: title ?? this.title,
      price: price ?? this.price,
      quotes: quotes ?? this.quotes,
      province: province ?? this.province,
      canton: canton ?? this.canton,
      districs: districs ?? this.districs,
      addressDetails: addressDetails ?? this.addressDetails,
      description: description ?? this.description,
      extras: extras ?? this.extras,
      photos: photos ?? this.photos,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        title,
        price,
        quotes,
        province,
        canton,
        districs,
        addressDetails,
        description,
        extras,
        photos,
        status
      ];
}
