import 'package:flutter_bloc_bd_medicine/core/usecase/usecase.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/models/medicine.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/domain/repository/repository.dart';

class GetMedicineUseCase implements UseCase<List<Medicine>,void>{

  final Repository _repository;

  GetMedicineUseCase(this._repository);

  @override
  Future<List<Medicine>> call({void params}) {
    return _repository.getAllMedicine();
  }

}