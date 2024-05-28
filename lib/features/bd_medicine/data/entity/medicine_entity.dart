import 'package:floor/floor.dart';

@Entity(tableName: 'brand')
class MedicineEntity {
  @primaryKey
  @ColumnInfo(name: 'brand_id')
  final String brandID;

  @ColumnInfo(name: 'generic_id')
  final String? genericId;

  @ColumnInfo(name: 'company_id')
  final String? companyId;

  @ColumnInfo(name: 'brand_name')
  final String? brandName;

  @ColumnInfo(name: 'form')
  final String? form;

  @ColumnInfo(name: 'strength')
  final String? strength;

  @ColumnInfo(name: 'price')
  final String? price;

  @ColumnInfo(name: 'packsize')
  final String? packSize;

  MedicineEntity(
      this.brandID,
      this.genericId,
      this.companyId,
      this.brandName,
      this.form,
      this.strength,
      this.price,
      this.packSize,
      );
}