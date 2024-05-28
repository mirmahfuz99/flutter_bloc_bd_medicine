import 'package:floor/floor.dart';

@Entity(tableName: 'generic')
class MedGenericsEntity {
  @primaryKey
  @ColumnInfo(name: 'generic_id')
  final String genericId;

  @ColumnInfo(name: 'generic_name')
  final String? genericName;

  @ColumnInfo(name: 'precaution')
  final String? precaution;

  @ColumnInfo(name: 'indication')
  final String? indication;

  @ColumnInfo(name: 'contra_indication')
  final String? contraIndication;

  @ColumnInfo(name: 'dose')
  final String? dose;

  @ColumnInfo(name: 'side_effect')
  final String? sideEffect;

  @ColumnInfo(name: 'pregnancy_category_id')
  final String? pregnancyCategoryId;

  @ColumnInfo(name: 'mode_of_action')
  final String? modeOfAction;

  @ColumnInfo(name: 'interaction')
  final String? interaction;

  MedGenericsEntity({
    required this.genericId,
    this.genericName,
    this.precaution,
    this.indication,
    this.contraIndication,
    this.dose,
    this.sideEffect,
    this.pregnancyCategoryId,
    this.modeOfAction,
    this.interaction,
  });
}
