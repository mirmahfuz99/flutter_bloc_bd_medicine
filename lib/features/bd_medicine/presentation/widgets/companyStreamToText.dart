import 'package:flutter/material.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/models/company.dart';

Widget companyStreamToText(Stream<Company> companyStream) {
  return StreamBuilder<Company>(
    stream: companyStream,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data!.name,style: Theme.of(context).textTheme.bodyMedium,);
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        return const Text('');
      }
    },
  );
}