// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  BdMedDbDao? _bdMedDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `brand` (`brand_id` TEXT NOT NULL, `generic_id` TEXT, `company_id` TEXT, `brand_name` TEXT, `form` TEXT, `strength` TEXT, `price` TEXT, `packsize` TEXT, PRIMARY KEY (`brand_id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `generic` (`generic_id` TEXT NOT NULL, `generic_name` TEXT, `precaution` TEXT, `indication` TEXT, `contra_indication` TEXT, `dose` TEXT, `side_effect` TEXT, `pregnancy_category_id` TEXT, `mode_of_action` TEXT, `interaction` TEXT, PRIMARY KEY (`generic_id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `company_name` (`company_id` TEXT NOT NULL, `company_name` TEXT, `company_order` TEXT, PRIMARY KEY (`company_id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `indication` (`indication_id` TEXT NOT NULL, `indication_name` TEXT, PRIMARY KEY (`indication_id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `indication_generic_index` (`generic_id` TEXT, `indication_id` TEXT, `id` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  BdMedDbDao get bdMedDao {
    return _bdMedDaoInstance ??= _$BdMedDbDao(database, changeListener);
  }
}

class _$BdMedDbDao extends BdMedDbDao {
  _$BdMedDbDao(
    this.database,
    this.changeListener,
  ) : _queryAdapter = QueryAdapter(database, changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  @override
  Future<List<MedicineEntity>> getAllBrandData() async {
    return _queryAdapter.queryList(
        'SELECT * FROM brand ORDER BY brand_name ASC',
        mapper: (Map<String, Object?> row) => MedicineEntity(
            row['brand_id'] as String,
            row['generic_id'] as String?,
            row['company_id'] as String?,
            row['brand_name'] as String?,
            row['form'] as String?,
            row['strength'] as String?,
            row['price'] as String?,
            row['packsize'] as String?));
  }

  @override
  Future<List<MedicineEntity>> getAllBrandDataDynamicQuery() async {
    return _queryAdapter.queryList('select * from BRAND',
        mapper: (Map<String, Object?> row) => MedicineEntity(
            row['brand_id'] as String,
            row['generic_id'] as String?,
            row['company_id'] as String?,
            row['brand_name'] as String?,
            row['form'] as String?,
            row['strength'] as String?,
            row['price'] as String?,
            row['packsize'] as String?));
  }

  @override
  Future<List<MedGenericsEntity>> getAllMedGenericsData() async {
    return _queryAdapter.queryList('select * from generic',
        mapper: (Map<String, Object?> row) => MedGenericsEntity(
            genericId: row['generic_id'] as String,
            genericName: row['generic_name'] as String?,
            precaution: row['precaution'] as String?,
            indication: row['indication'] as String?,
            contraIndication: row['contra_indication'] as String?,
            dose: row['dose'] as String?,
            sideEffect: row['side_effect'] as String?,
            pregnancyCategoryId: row['pregnancy_category_id'] as String?,
            modeOfAction: row['mode_of_action'] as String?,
            interaction: row['interaction'] as String?));
  }

  @override
  Future<List<CompanyEntity>> getAllCompanyData() async {
    return _queryAdapter.queryList('SELECT * FROM company_name',
        mapper: (Map<String, Object?> row) => CompanyEntity(
            row['company_id'] as String,
            row['company_name'] as String?,
            row['company_order'] as String?));
  }

  @override
  Future<List<IndicationsEntity>> getAllIndications() async {
    return _queryAdapter.queryList('SELECT * FROM indication',
        mapper: (Map<String, Object?> row) => IndicationsEntity(
            indicationId: row['indication_id'] as String,
            indicationName: row['indication_name'] as String?));
  }

  @override
  Stream<List<MedicineEntity>> getSimilarMedicine(
    String genericId,
      {
    String form = '%%',
    String strength = '%%',
  }) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM brand WHERE generic_id = ?1 AND form LIKE ?2 AND strength LIKE ?3',
        mapper: (Map<String, Object?> row) => MedicineEntity(
            row['brand_id'] as String,
            row['generic_id'] as String?,
            row['company_id'] as String?,
            row['brand_name'] as String?,
            row['form'] as String?,
            row['strength'] as String?,
            row['price'] as String?,
            row['packsize'] as String?),
        arguments: [genericId, form, strength],
        queryableName: 'brand',
        isView: false);
  }

  @override
  Stream<List<MedicineEntity>> getMedsByGenerics(String genericId) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM brand WHERE generic_id = ?1',
        mapper: (Map<String, Object?> row) => MedicineEntity(
            row['brand_id'] as String,
            row['generic_id'] as String?,
            row['company_id'] as String?,
            row['brand_name'] as String?,
            row['form'] as String?,
            row['strength'] as String?,
            row['price'] as String?,
            row['packsize'] as String?),
        arguments: [genericId],
        queryableName: 'brand',
        isView: false);
  }

  @override
  Stream<List<MedicineEntity>> getMedicinesCompanyId(String companyId) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM brand WHERE company_id = ?1',
        mapper: (Map<String, Object?> row) => MedicineEntity(
            row['brand_id'] as String,
            row['generic_id'] as String?,
            row['company_id'] as String?,
            row['brand_name'] as String?,
            row['form'] as String?,
            row['strength'] as String?,
            row['price'] as String?,
            row['packsize'] as String?),
        arguments: [companyId],
        queryableName: 'brand',
        isView: false);
  }

  @override
  Stream<CompanyEntity?> getCompanyDetailsByCompanyId(String companyId) {
    return _queryAdapter.queryStream(
        'SELECT * FROM company_name WHERE company_id = ?1',
        mapper: (Map<String, Object?> row) => CompanyEntity(
            row['company_id'] as String,
            row['company_name'] as String?,
            row['company_order'] as String?),
        arguments: [companyId],
        queryableName: 'company_name',
        isView: false);
  }

  @override
  Future<List<MedicineEntity>> getOtherSimilarMedicines(
    String genericId,
    String excludeMedId,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM brand WHERE generic_id = ?1 AND brand_id != ?2',
        mapper: (Map<String, Object?> row) => MedicineEntity(
            row['brand_id'] as String,
            row['generic_id'] as String?,
            row['company_id'] as String?,
            row['brand_name'] as String?,
            row['form'] as String?,
            row['strength'] as String?,
            row['price'] as String?,
            row['packsize'] as String?),
        arguments: [genericId, excludeMedId]);
  }
}
