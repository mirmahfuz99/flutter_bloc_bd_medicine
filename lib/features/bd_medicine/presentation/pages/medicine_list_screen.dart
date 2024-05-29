import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/models/company.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/models/generic.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/models/medicine.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/bloc/bd_medicine_bloc.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/bloc/bd_medicine_state.dart';

class MedicineListScreen extends StatelessWidget {
  const MedicineListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BdMedicineBloc, BdMedicineState>(
        builder: (context,state){
          if(state is BDMedicineLoading){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(state is BDMedicineLoaded) {
            if (state.medicines!.isEmpty) {
              return const Center(
                  child: Text(
                    'No Data Found !',
                    style: TextStyle(color: Colors.black),
                  ));
            }
            return ListView.builder(itemBuilder: (context, index){
              Medicine medicines = state.medicines!.elementAt(index);


                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(medicines.name,style: Theme.of(context).textTheme.titleLarge,),
                            const SizedBox(width: 10.0,),
                            Text(medicines.type!),
                          ],
                        ),
                        Text(medicines.strength!),
                        const Divider(),
                        companyStreamToText(medicines.companyDetails!),
                        genericStreamToText(medicines.generic!)


                      ],
                    ),
                  ),
                );
            }, itemCount: 50,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget genericStreamToText(Stream<Generic> genericStream) {
    return StreamBuilder<Generic>(
      stream: genericStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.name);
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const Text('');
        }
      },
    );
  }

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
}
