import 'package:floor/floor.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/dao/db_dao.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/entity/company_entity.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/entity/generic_indication_entity.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/entity/indications_entity.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/entity/med_generics_entity.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/entity/medicine_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';


@Database(version: 1, entities: [ MedicineEntity, MedGenericsEntity, CompanyEntity,
                                  IndicationsEntity, GenericIndicationEntity])
abstract class AppDatabase extends FloorDatabase {
  BdMedDbDao get bdMedDao;
}