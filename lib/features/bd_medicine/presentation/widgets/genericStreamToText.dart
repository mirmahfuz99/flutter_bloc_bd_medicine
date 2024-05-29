import 'package:flutter/material.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/models/generic.dart';

Widget genericStreamToText(Stream<Generic> genericStream) {
  return StreamBuilder<Generic>(
    stream: genericStream,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data!.name,style: Theme.of(context).textTheme.titleMedium!,);
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        return const Text('');
      }
    },
  );
}
