
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/models/company.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/models/generic.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/models/medicine.dart';

abstract class Repository {

  // Database methods
  Future<List<Generic>> getSavedGenerics();

  Future<List<Company>> getAllCompany();

  Future<List<Medicine>> getAllMedicine();


}