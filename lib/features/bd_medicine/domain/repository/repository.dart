import 'package:flutter_bloc_bd_medicine/models/generic.dart';

abstract class Repository {

  // Database methods
  Future<List<Generic>> getSavedGenerics();


}