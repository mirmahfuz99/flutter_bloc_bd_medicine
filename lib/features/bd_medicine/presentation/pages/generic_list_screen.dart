
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/bloc/bd_medicine_bloc.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/bloc/bd_medicine_state.dart';
import 'package:flutter_bloc_bd_medicine/models/company.dart';
import 'package:flutter_bloc_bd_medicine/models/generic.dart';
import 'package:flutter_bloc_bd_medicine/models/medicine.dart';

class GenericListScreen extends StatelessWidget {
  const GenericListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BdMedicineBloc, BdMedicineState>(
        builder: (context,state){
          if(state is BDMedicineLoading){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(state is BDMedicineLoaded) {
            print("g_length:${state.medicines!.length}");
            if (state.medicines!.isEmpty) {
              return const Center(
                  child: Text(
                    'No Data Found !',
                    style: TextStyle(color: Colors.black),
                  ));
            }
            return ListView.builder(
                itemBuilder: (context, index){
              Generic generic = state.generics!.elementAt(index);
              return Card(
                elevation: .25,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(generic.name,style: Theme.of(context).textTheme.bodyLarge,),

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
}
