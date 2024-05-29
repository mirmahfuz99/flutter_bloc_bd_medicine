import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/data_sources/app_database.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/repository/repository_impl.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/domain/repository/repository.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/domain/usecases/get_company.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/domain/usecases/get_generic.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/domain/usecases/get_medicine.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/bloc/bd_medicine_bloc.dart';
import 'package:get_it/get_it.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "medicine.db");
    bool dbExists = await io.File(path).exists();
    if (!dbExists) {
      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "medicine.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      // Write and flush the bytes written
      await io.File(path).writeAsBytes(bytes, flush: true);
    }

  final database = await $FloorAppDatabase.databaseBuilder(path).build();
  // print(await database.bdMedDao.getAllCompanyData());
  sl.registerSingleton<AppDatabase>(database);


  // Dependencies
  sl.registerSingleton<Repository>(
      RepositoryImplementation(sl())
  );

  //UseCases
  sl.registerSingleton<GetMedicineUseCase>(GetMedicineUseCase(sl()));
  sl.registerSingleton<GetGenericUseCase>(GetGenericUseCase(sl()));
  sl.registerSingleton<GetCompanyUseCase>(GetCompanyUseCase(sl()));

  //Blocs
  sl.registerFactory<BdMedicineBloc>(()=> BdMedicineBloc(sl(),sl(),sl()));

}