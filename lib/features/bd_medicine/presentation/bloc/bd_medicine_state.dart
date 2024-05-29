import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_bd_medicine/models/company.dart';
import 'package:flutter_bloc_bd_medicine/models/generic.dart';
import 'package:flutter_bloc_bd_medicine/models/medicine.dart';

abstract class BdMedicineState extends Equatable {
  final List<Medicine>? medicines;
  final List<Generic>? generics;
  final List<Company>? companys;

  const BdMedicineState({this.medicines,this.generics, this.companys});

  @override
  List<Object> get props => [medicines ?? [], generics ?? [], companys ?? []];
}

class BDMedicineLoading extends BdMedicineState {
  const BDMedicineLoading();
}

class BDMedicineLoaded extends BdMedicineState {
  const BDMedicineLoaded( List<Medicine> medicines, List<Generic> generics, List<Company> companys) : super(generics: generics, medicines: medicines,companys: companys);
}