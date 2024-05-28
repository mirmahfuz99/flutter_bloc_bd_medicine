import 'package:flutter_bloc_bd_medicine/core/usecase/usecase.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/domain/repository/repository.dart';
import 'package:flutter_bloc_bd_medicine/models/generic.dart';

class GetMedicineUseCase implements UseCase<List<Generic>,void>{

  final Repository _repository;

  GetMedicineUseCase(this._repository);

  @override
  Future<List<Generic>> call({void params}) {
    return _repository.getSavedGenerics();
  }

}