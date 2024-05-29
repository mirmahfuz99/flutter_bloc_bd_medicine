import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/models/generic.dart';

abstract class BDMedicineEvent extends Equatable {
  final Generic ? generic;

  const BDMedicineEvent({this.generic});

  @override
  List<Object> get props => [generic!];
}


class GetGeneric extends BDMedicineEvent {
  const GetGeneric();
}
