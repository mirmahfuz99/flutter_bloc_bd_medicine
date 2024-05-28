import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_bd_medicine/models/generic.dart';

abstract class BdMedicineState extends Equatable {
  final List<Generic>? generic;

  const BdMedicineState({this.generic});

  @override
  List<Object> get props => [generic ?? []];
}

class BDMedicineLoading extends BdMedicineState {
  const BDMedicineLoading();
}

class BDMedicineLoaded extends BdMedicineState {
  const BDMedicineLoaded(List<Generic> generic) : super(generic: generic);
}