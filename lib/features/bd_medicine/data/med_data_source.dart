import 'package:flutter_bloc_bd_medicine/models/company.dart';
import 'package:flutter_bloc_bd_medicine/models/generic.dart';
import 'package:flutter_bloc_bd_medicine/models/medicine.dart';

abstract class MedDataSource {
  Future<List<Medicine>> getAllMedicines({String medSearchQuery = '', bool byMedNameAsc = true});
  Future<List<Generic>> getAllGenerics({String genericSearchQuery = '', bool byNameAsc = true});
  Future<List<Company>> getAllCompany({String searchQuery = '', bool byNameAsc = true});
}