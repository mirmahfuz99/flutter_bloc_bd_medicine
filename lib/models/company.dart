import 'package:flutter_bloc_bd_medicine/models/medicine.dart';

class Company {
  final String name;
  final Stream<List<Medicine>> medicines;

  Company({
    required this.name,
    Stream<List<Medicine>>? medicines,
  }) : medicines = medicines ?? const Stream<List<Medicine>>.empty();
}