import 'package:floor/floor.dart';

@Entity(tableName: 'indication')
class IndicationsEntity {
  @PrimaryKey()
  @ColumnInfo(name: 'indication_id')
  final String indicationId;

  @ColumnInfo(name: 'indication_name')
  final String? indicationName;

  IndicationsEntity({
    required this.indicationId,
    this.indicationName,
  });
}
