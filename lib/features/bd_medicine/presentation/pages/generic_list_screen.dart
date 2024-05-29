
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/models/generic.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/bloc/bd_medicine_bloc.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/bloc/bd_medicine_state.dart';

class GenericListScreen extends StatelessWidget {
  const GenericListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody(){
    return BlocBuilder<BdMedicineBloc, BdMedicineState>(
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
          return ListView.builder(
            itemBuilder: (context, index){
              Generic generic = state.generics!.elementAt(index);
              return Card(
                color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(.2),
                elevation: .25,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(generic.name,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18),),

                    ],
                  ),
                ),
              );
            }, itemCount: 50,
          );
        }
        return const SizedBox();
      },
    );
  }
}
