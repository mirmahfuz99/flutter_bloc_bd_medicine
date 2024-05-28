import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/app_database.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/entity/company_entity.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/entity/med_generics_entity.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/entity/medicine_entity.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/domain/repository/repository.dart';
import 'package:flutter_bloc_bd_medicine/models/company.dart';
import 'package:flutter_bloc_bd_medicine/models/generic.dart';
import 'package:flutter_bloc_bd_medicine/models/medicine.dart';

class RepositoryImplementation implements Repository {

  final AppDatabase _appDatabase;
  RepositoryImplementation(this._appDatabase);


  @override
  Future<List<Medicine>> getAllMedicine() async {
    return _appDatabase.bdMedDao.getAllBrandDataDynamicQuery().then((data) {
      var value = data.map((item) => toMedicine(item)).toList();
      return value;
    });
  }

  Medicine toMedicine(MedicineEntity medicineEntity, ) {
    return Medicine(
      name:medicineEntity.brandName ?? "",
      type:medicineEntity.form,
      strength: medicineEntity.strength,
      generic: _appDatabase.bdMedDao.getGenericById(medicineEntity.genericId!).map((item) => toMedGeneric(item!)),
      companyDetails: _appDatabase.bdMedDao.getCompanyDetailsByCompanyId(medicineEntity.companyId!).map((item) => toCompany(item!))
    );
  }

  @override
  Future<List<Generic>> getSavedGenerics() async {
    return _appDatabase.bdMedDao.getAllMedGenericsData().then((data) {
      var value = data.map((item) => toMedGeneric(item)).toList();
      return value;
    });
  }

  Generic toMedGeneric(MedGenericsEntity medGenericsEntity, ) {
    return Generic(
      name:medGenericsEntity.genericName ?? "",
      indication:medGenericsEntity.indication,
      contraIndication: medGenericsEntity.contraIndication,
      dosage: medGenericsEntity.dose,
      sideEffect: medGenericsEntity.sideEffect,
    );
  }

  @override
  Future<List<Company>> getAllCompany() async {
    return _appDatabase.bdMedDao.getAllCompanyData().then((data) {
      var value = data.map((item) => toCompany(item)).toList();
      return value;
    });
  }


  Company toCompany(CompanyEntity companyEntity){
    return Company(
      name: companyEntity.companyName ?? '',
      medicines: _appDatabase.bdMedDao.getMedicinesCompanyId(companyEntity.companyId).then((data){
        var value = data.map((item) => toMedicine(item)).toList();
        return value;
      })
    );
  }
}