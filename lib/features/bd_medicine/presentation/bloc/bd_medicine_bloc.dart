import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/domain/usecases/get_company.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/domain/usecases/get_generic.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/domain/usecases/get_medicine.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/bloc/bd_medicine_event.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/bloc/bd_medicine_state.dart';
import 'package:flutter_bloc_bd_medicine/models/company.dart';
import 'package:flutter_bloc_bd_medicine/models/generic.dart';
import 'package:flutter_bloc_bd_medicine/models/medicine.dart';


class BdMedicineBloc extends Bloc<BDMedicineEvent,BdMedicineState> {
  final GetMedicineUseCase _getMedicineUseCase;
  // final GetGenericUseCase _getGenericUseCase;
  // final GetCompanyUseCase _getCompanyUseCase;

  BdMedicineBloc(this._getMedicineUseCase, /*this._getGenericUseCase, this._getCompanyUseCase*/) : super(const BDMedicineLoading()){
    on <GetGeneric> (onGetGeneric);
  }

  void onGetGeneric(GetGeneric event,Emitter<BdMedicineState> emit) async {
    final medicine = await _getMedicineUseCase();
    // final generics = await _getGenericUseCase();
    // final company = await _getCompanyUseCase();

    medicine.elementAt(0).generic!.listen((Generic? generic){
      print(generic!.name);
    });

    medicine.elementAt(0).companyDetails!.listen((Company? company){
      print(company!.name);
    });

    if( medicine.isNotEmpty){
      emit(BDMedicineLoaded(medicine));
      // emit(BDMedicineLoaded(medicine,generics,company));
    }
  }
}