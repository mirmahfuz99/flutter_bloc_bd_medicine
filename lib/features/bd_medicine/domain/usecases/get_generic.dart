import 'package:flutter_bloc_bd_medicine/core/usecase/usecase.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/models/generic.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/domain/repository/repository.dart';

class GetGenericUseCase implements UseCase<List<Generic>,void>{

  final Repository _repository;

  GetGenericUseCase(this._repository);

  @override
  Future<List<Generic>> call({void params}) {
    return _repository.getSavedGenerics();
  }

}