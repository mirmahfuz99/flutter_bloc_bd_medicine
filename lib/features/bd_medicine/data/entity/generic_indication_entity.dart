import 'package:floor/floor.dart';

@Entity(tableName: 'indication_generic_index')
class GenericIndicationEntity {
  @ColumnInfo(name: 'generic_id')
  final String? genericId;

  @ColumnInfo(name: 'indication_id')
  final String? indicationId;

  @PrimaryKey(autoGenerate: false)
  @ColumnInfo(name: 'id')
  final int id;

  GenericIndicationEntity(this.genericId, this.indicationId, this.id);
}
