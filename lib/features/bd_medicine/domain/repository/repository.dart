import 'package:flutter_bloc_bd_medicine/models/company.dart';
import 'package:flutter_bloc_bd_medicine/models/generic.dart';
import 'package:flutter_bloc_bd_medicine/models/medicine.dart';

abstract class Repository {

  // Database methods
  Future<List<Generic>> getSavedGenerics();

  Future<List<Company>> getAllCompany();

  Future<List<Medicine>> getAllMedicine();


}