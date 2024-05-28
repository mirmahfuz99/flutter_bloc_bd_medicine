import 'package:flutter_bloc_bd_medicine/core/usecase/usecase.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/domain/repository/repository.dart';
import 'package:flutter_bloc_bd_medicine/models/medicine.dart';

class GetMedicineUseCase implements UseCase<List<Medicine>,void>{

  final Repository _repository;

  GetMedicineUseCase(this._repository);

  @override
  Future<List<Medicine>> call({void params}) {
    return _repository.getAllMedicine();
  }

}