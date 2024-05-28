import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/domain/usecases/get_generic.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/bloc/bd_medicine_event.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/bloc/bd_medicine_state.dart';


class BdMedicineBloc extends Bloc<BDMedicineEvent,BdMedicineState> {
  final GetMedicineUseCase _getMedicineUseCase;

  BdMedicineBloc(this._getMedicineUseCase) : super(const BDMedicineLoading()){
    on <GetGeneric> (onGetGeneric);
  }

  void onGetGeneric(GetGeneric event,Emitter<BdMedicineState> emit) async {
    final generics = await _getMedicineUseCase();

    if( generics.isNotEmpty){
      print("inside");
      emit(BDMedicineLoaded(generics));
    }
  }
}