import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/models/medicine.dart';

class Company {
  final String name;
  final Future<List<Medicine>> medicines;

  Company({
    required this.name,
    Future<List<Medicine>>? medicines,
  }) : medicines = medicines!;
}