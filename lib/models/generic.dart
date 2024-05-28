import 'package:flutter_bloc_bd_medicine/models/medicine.dart';

class Generic {
  final String name;
  final String? indication;
  final String? contraIndication;
  final String? dosage;
  final String? sideEffect;
  final Stream<List<Medicine>>? medicines;

  Generic({
    required this.name,
    this.indication,
    this.contraIndication,
    this.dosage,
    this.sideEffect,
    this.medicines,
  });
}