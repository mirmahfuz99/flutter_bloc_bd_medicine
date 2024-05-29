import 'package:floor/floor.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/entity/company_entity.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/entity/indications_entity.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/entity/med_generics_entity.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/entity/medicine_entity.dart';


@dao
abstract class BdMedDbDao {
  @Query('SELECT * FROM brand ORDER BY brand_name ASC')
  Future<List<MedicineEntity>> getAllBrandData();

  @Query('select * from BRAND ')
  Future<List<MedicineEntity>> getAllBrandDataDynamicQuery();

  // @Query('select * from generic where generic_name like :genericSearchQuery order by generic_name asc')
  @Query('select * from generic')
  Future<List<MedGenericsEntity>> getAllMedGenericsData();

  @Query('SELECT * FROM company_name')
  Future<List<CompanyEntity>> getAllCompanyData();

  @Query('SELECT * FROM indication')
  Future<List<IndicationsEntity>> getAllIndications();

  @Query('SELECT * FROM generic WHERE generic_id = :genericId')
  Stream<MedGenericsEntity?> getGenericById(String genericId);


  @Query('SELECT * FROM brand WHERE generic_id = :genericId AND form LIKE :form AND strength LIKE :strength')
  Stream<List<MedicineEntity>> getSimilarMedicine(String genericId, {String form = '%%', String strength = '%%'});

  @Query('SELECT * FROM brand WHERE generic_id = :genericId')
  Stream<List<MedicineEntity>> getMedsByGenerics(String genericId);

  @Query('SELECT * FROM brand WHERE company_id = :companyId')
  Future<List<MedicineEntity>> getMedicinesCompanyId(String companyId);

  @Query('SELECT * FROM company_name WHERE company_id = :companyId')
  Stream<CompanyEntity?> getCompanyDetailsByCompanyId(String companyId);

  @Query('SELECT * FROM brand WHERE generic_id = :genericId AND brand_id != :excludeMedId')
  Future<List<MedicineEntity>> getOtherSimilarMedicines(String genericId, String excludeMedId);


}
