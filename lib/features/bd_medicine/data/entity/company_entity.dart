import 'package:floor/floor.dart';

@Entity(tableName: 'company_name')
class CompanyEntity {
  @primaryKey
  @ColumnInfo(name: 'company_id')
  final String companyId;

  @ColumnInfo(name: 'company_name')
  final String? companyName;

  @ColumnInfo(name: 'company_order')
  final String? companyOrder;

  CompanyEntity(this.companyId, this.companyName, this.companyOrder);
}
