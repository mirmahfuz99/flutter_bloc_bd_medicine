import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/models/company.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/models/generic.dart';

class Medicine {
  final String name;
  final String? type;
  final String? strength;
  final String? genericName;
  final String? companyName;
  final Stream<Generic>? generic;
  final Stream<List<Medicine>>? similarMedicines;
  final Stream<Company>? companyDetails;

  Medicine({
    required this.name,
    this.type,
    this.strength,
    this.genericName,
    this.companyName,
    this.generic,
    this.similarMedicines,
    this.companyDetails,
  });


}