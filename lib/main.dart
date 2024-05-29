import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_bd_medicine/config/routes/routes.dart';
import 'package:flutter_bloc_bd_medicine/config/theme/dark_theme.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/bloc/bd_medicine_bloc.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/bloc/bd_medicine_event.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/pages/home/bd_medicine_screen.dart';
import 'package:flutter_bloc_bd_medicine/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<BdMedicineBloc>()..add(const GetGeneric()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: dark,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const BDMedicineScreen(),
      ),
    );
  }
}


