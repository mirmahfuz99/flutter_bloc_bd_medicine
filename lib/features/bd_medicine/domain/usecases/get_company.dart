import 'package:flutter_bloc_bd_medicine/core/usecase/usecase.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/domain/repository/repository.dart';
import 'package:flutter_bloc_bd_medicine/models/company.dart';
import 'package:flutter_bloc_bd_medicine/models/generic.dart';

class GetCompanyUseCase implements UseCase<List<Company>,void>{

  final Repository _repository;

  GetCompanyUseCase(this._repository);

  @override
  Future<List<Company>> call({void params}) {
    return _repository.getAllCompany();
  }

}