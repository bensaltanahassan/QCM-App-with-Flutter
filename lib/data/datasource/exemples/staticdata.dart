import 'package:qcmapp/core/constant/imageassets.dart';
import 'package:qcmapp/data/model/categorymodel.dart';
import 'package:qcmapp/data/model/schoolmodel.dart';

List<SchoolModel> schoolsList = [
  SchoolModel(AppImageAsset.ensa, "ENSA"),
  SchoolModel(AppImageAsset.medecine, "Medecine"),
  SchoolModel(AppImageAsset.ensam, "ENSAM"),
  SchoolModel(AppImageAsset.encg, "ENCG"),
  SchoolModel(AppImageAsset.ena, "ENA"),
];
List<CategoryModel> categories = [
  CategoryModel(
    id: 1,
    name: "Mathematiques",
    image: AppImageAsset.math,
  ),
  CategoryModel(
    id: 2,
    image: AppImageAsset.pc,
    name: "physics ",
  ),
  CategoryModel(
    id: 3,
    image: AppImageAsset.svt,
    name: "SVT",
  ),
];
