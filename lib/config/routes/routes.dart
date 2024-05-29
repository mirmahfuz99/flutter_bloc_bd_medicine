import 'package:flutter/material.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/pages/home/bd_medicine_screen.dart';



class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const BDMedicineScreen());
        
      default:
        return _materialRoute(const BDMedicineScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
