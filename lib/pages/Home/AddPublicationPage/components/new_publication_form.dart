import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:programathon_tuercas_2020/Models/user_profile.dart';
import 'package:programathon_tuercas_2020/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:programathon_tuercas_2020/blocs/NewPublication/newpublication_cubit.dart';
import 'package:programathon_tuercas_2020/widgets/chip_custom.dart';
import 'package:programathon_tuercas_2020/widgets/default_button.dart';
import 'package:programathon_tuercas_2020/widgets/text_fiield.dart';
import 'package:formz/formz.dart';

class FormPublication extends StatefulWidget {
  FormPublication({Key key}) : super(key: key);

  @override
  _FormPublicationState createState() => _FormPublicationState();
}

class _FormPublicationState extends State<FormPublication> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        BlocBuilder<NewpublicationCubit, PublicationFormnState>(
          buildWhen: (previous, current) => previous.photos != current.photos,
          builder: (context, state) {
            if (state.photos.value.length > 0) {
              return Column(children: [
                MaterialButton(
                  onPressed: () {
                    context.read<NewpublicationCubit>().photosAdded();
                  },
                  shape: CircleBorder(),
                  child: Icon(Icons.add_a_photo),
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(state.photos.value.length, (index) {
                      Asset asset = state.photos.value[index];
                      return AssetThumb(
                        asset: asset,
                        width: 300,
                        height: 300,
                      );
                    }),
                  ),
                ),
              ]);
            }
            return Center(
              child: Container(
                child: Column(
                  children: [
                    Text('Debe agregar al menos una foto'),
                    MaterialButton(
                      onPressed: () {
                        context.read<NewpublicationCubit>().photosAdded();
                      },
                      shape: CircleBorder(),
                      child: Icon(Icons.add_a_photo),
                    )
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: 30,
        ),
        BlocBuilder<NewpublicationCubit, PublicationFormnState>(
          buildWhen: (previous, current) => previous.title != current.title,
          builder: (context, state) {
            return TextFieldCustom(
              label: 'Titulo',
              hintText: 'Ejm: Tour al volcan Poas',
              inputType: TextInputType.text,
              icon: Icons.text_fields,
              erroMessage: 'Solo letras permitidasdg',
              errorOccurred: state.title.invalid,
              onChanged: (value) =>
                  context.read<NewpublicationCubit>().titleChanged(value),
            );
          },
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Flexible(
              child: BlocBuilder<NewpublicationCubit, PublicationFormnState>(
                buildWhen: (previous, current) =>
                    previous.price != current.price,
                builder: (context, state) {
                  return TextFieldCustom(
                    label: 'Precio',
                    hintText: 'Ejm:10000',
                    icon: Icons.monetization_on,
                    errorOccurred: state.price.invalid,
                    erroMessage: 'Solo numeros',
                    inputType: TextInputType.number,
                    onChanged: (value) =>
                        context.read<NewpublicationCubit>().priceChanged(value),
                  );
                },
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Flexible(
              child: BlocBuilder<NewpublicationCubit, PublicationFormnState>(
                buildWhen: (previous, current) =>
                    previous.quotes != current.quotes,
                builder: (context, state) {
                  return TextFieldCustom(
                    label: 'Cupos',
                    hintText: 'Ejm:10',
                    icon: Icons.people,
                    errorOccurred: state.quotes.invalid,
                    erroMessage: 'Solo numeros',
                    inputType: TextInputType.number,
                    onChanged: (value) => context
                        .read<NewpublicationCubit>()
                        .quotesChanged(value),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        BlocBuilder<NewpublicationCubit, PublicationFormnState>(
          buildWhen: (previous, current) =>
              previous.province != current.province,
          builder: (context, state) {
            return TextFieldCustom(
              label: 'Provincia',
              hintText: 'Ejm: Alajuela',
              icon: Icons.location_city,
              errorOccurred: state.province.invalid,
              erroMessage: 'Solo letras',
              inputType: TextInputType.text,
              onChanged: (value) =>
                  context.read<NewpublicationCubit>().provinceChanged(value),
            );
          },
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Flexible(
              child: BlocBuilder<NewpublicationCubit, PublicationFormnState>(
                buildWhen: (previous, current) =>
                    previous.canton != current.canton,
                builder: (context, state) {
                  return TextFieldCustom(
                    label: 'Cantón',
                    hintText: 'Cantón',
                    icon: Icons.location_city,
                    errorOccurred: state.canton.invalid,
                    erroMessage: 'Solo letras',
                    inputType: TextInputType.text,
                    onChanged: (value) => context
                        .read<NewpublicationCubit>()
                        .cantonChanged(value),
                  );
                },
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Flexible(
              child: BlocBuilder<NewpublicationCubit, PublicationFormnState>(
                buildWhen: (previous, current) =>
                    previous.districs != current.districs,
                builder: (context, state) {
                  return TextFieldCustom(
                    label: 'Distrito',
                    hintText: 'Distrito',
                    icon: Icons.location_city,
                    errorOccurred: state.districs.invalid,
                    erroMessage: 'Solo letras',
                    inputType: TextInputType.text,
                    onChanged: (value) => context
                        .read<NewpublicationCubit>()
                        .districsChanged(value),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        BlocBuilder<NewpublicationCubit, PublicationFormnState>(
          buildWhen: (previous, current) =>
              previous.addressDetails != current.addressDetails,
          builder: (context, state) {
            return TextFieldCustom(
              maxLines: 2,
              label: 'Dirección',
              hintText: 'Ejm: 1km norte de mega super',
              icon: Icons.location_on,
              errorOccurred: state.addressDetails.invalid,
              erroMessage: 'Solo letras y numeros',
              inputType: TextInputType.text,
              onChanged: (value) => context
                  .read<NewpublicationCubit>()
                  .addressDetailsChanged(value),
            );
          },
        ),
        SizedBox(
          height: 30,
        ),
        BlocBuilder<NewpublicationCubit, PublicationFormnState>(
          buildWhen: (previous, current) =>
              previous.description != current.description,
          builder: (context, state) {
            return TextFieldCustom(
              maxLines: 10,
              label: 'Descripción',
              hintText: 'Escriba aquí',
              errorOccurred: state.description.invalid,
              erroMessage: 'Solo letras y numeros',
              inputType: TextInputType.text,
              onChanged: (value) =>
                  context.read<NewpublicationCubit>().descriptionChanged(value),
            );
          },
        ),
        SizedBox(
          height: 30,
        ),
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Elige las comodidades',
              style: TextStyle(fontSize: 20.0),
            )),
        SizedBox(
          height: 10,
        ),
        BlocBuilder<NewpublicationCubit, PublicationFormnState>(
          buildWhen: (previous, current) => previous.extras != current.extras,
          builder: (context, state) {
            return Wrap(
              spacing: 8.0,
              alignment: WrapAlignment.start,
              children: [
                ChipBenefits(
                  label: 'Alimentacion',
                  color: Colors.greenAccent,
                  icon: Icons.fastfood,
                  onPressed: (slected) {
                    slected
                        ? context
                            .read<NewpublicationCubit>()
                            .extrasAdded('Alimentacion')
                        : context
                            .read<NewpublicationCubit>()
                            .extrasRemoved('Alimentacion');
                  },
                  isSelected: state.extras.contains('Alimentacion'),
                ),
                ChipBenefits(
                  label: 'Transporte',
                  color: Colors.greenAccent,
                  icon: Icons.airport_shuttle,
                  onPressed: (slected) {
                    slected
                        ? context
                            .read<NewpublicationCubit>()
                            .extrasAdded('Transporte')
                        : context
                            .read<NewpublicationCubit>()
                            .extrasRemoved('Transporte');
                  },
                  isSelected: state.extras.contains('Transporte'),
                )
              ],
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<NewpublicationCubit, PublicationFormnState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              return state.status.isSubmissionInProgress
                  ? LinearProgressIndicator()
                  : DefaultButton(
                      text: 'Publicar',
                      press: state.status.isValidated
                          ? () {
                              final user =
                                  context.read<AuthenticationBloc>().state.user;
                              context
                                  .read<NewpublicationCubit>()
                                  .summitFromPublication(new UserProfile(
                                      userName: user.name,
                                      email: user.email,
                                      id: user.id,
                                      photoUri: user.photo));

                              if (state.status.isSubmissionSuccess) {
                                Navigator.of(context)
                                    .pushReplacementNamed('home');
                              }
                            }
                          : null,
                    );
            },
          ),
        ),
      ],
    );
  }
}
