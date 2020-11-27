import 'package:programathon_tuercas_2020/pages/Home/dumydata/country_model.dart';

List<ProvinceModel> getProvince() {
  List<ProvinceModel> country = new List();
  ProvinceModel countryModel = new ProvinceModel();

//1
  countryModel.provinceName = "San José";
  countryModel.label = "New";
  countryModel.noOfTours = 18;
  countryModel.rating = 4.5;
  countryModel.imgUrl = "assets/images/sanjose.jpg";
  country.add(countryModel);
  countryModel = new ProvinceModel();

  //1
  countryModel.provinceName = "Alajuela";
  countryModel.label = "Sale";
  countryModel.noOfTours = 12;
  countryModel.rating = 4.3;
  countryModel.imgUrl = "assets/images/alajuela.jpg";
  ;
  country.add(countryModel);
  countryModel = new ProvinceModel();

  //1
  countryModel.provinceName = "Cartago";
  countryModel.label = "New";
  countryModel.noOfTours = 18;
  countryModel.rating = 4.5;
  countryModel.imgUrl = "assets/images/cartago.jpg";
  ;
  country.add(countryModel);
  countryModel = new ProvinceModel();

  //1
  countryModel.provinceName = "Heredia";
  countryModel.label = "New";
  countryModel.noOfTours = 18;
  countryModel.rating = 4.5;
  countryModel.imgUrl = "assets/images/heredia.jpg";
  ;
  country.add(countryModel);
  countryModel = new ProvinceModel();

  //1
  countryModel.provinceName = "Guanacaste";
  countryModel.label = "New";
  countryModel.noOfTours = 18;
  countryModel.rating = 4.5;
  countryModel.imgUrl = "assets/images/guanacaste.jpg";
  ;
  country.add(countryModel);
  countryModel = new ProvinceModel();

  //1
  countryModel.provinceName = "Puntarenas";
  countryModel.label = "New";
  countryModel.noOfTours = 18;
  countryModel.rating = 4.5;
  countryModel.imgUrl = "assets/images/puntaarenas.jpg";
  ;
  country.add(countryModel);
  countryModel = new ProvinceModel();

  //1
  countryModel.provinceName = "Limón";
  countryModel.label = "New";
  countryModel.noOfTours = 18;
  countryModel.rating = 4.5;
  countryModel.imgUrl = "assets/images/limon.jpg";
  ;
  country.add(countryModel);
  countryModel = new ProvinceModel();

  return country;
}
