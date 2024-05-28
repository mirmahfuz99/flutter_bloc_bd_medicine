import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/app_database.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/entity/med_generics_entity.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/entity/medicine_entity.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/domain/repository/repository.dart';
import 'package:flutter_bloc_bd_medicine/models/generic.dart';
import 'package:flutter_bloc_bd_medicine/models/medicine.dart';

class RepositoryImplementation implements Repository {

  final AppDatabase _appDatabase;
  RepositoryImplementation(this._appDatabase);


  Future<List<Medicine>> getAllMedicines(String medSearchQuery, bool byMedNameAsc) async {
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

}