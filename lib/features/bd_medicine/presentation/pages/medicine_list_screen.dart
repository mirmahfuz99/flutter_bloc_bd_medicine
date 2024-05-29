import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/models/company.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/models/generic.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/data/models/medicine.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/bloc/bd_medicine_bloc.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/bloc/bd_medicine_state.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/widgets/companyStreamToText.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/widgets/genericStreamToText.dart';

class MedicineListScreen extends StatelessWidget {
  const MedicineListScreen({super.key});

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
          return ListView.builder(itemBuilder: (context, index){
            Medicine medicines = state.medicines!.elementAt(index);


            return Card(
              color: Theme.of(context).textTheme.titleLarge!.color!.withOpacity(.2),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(medicines.name,style: Theme.of(context).textTheme.titleLarge,),
                        const SizedBox(width: 10.0,),
                        Text(medicines.type!,style: Theme.of(context).textTheme.titleMedium!),
                      ],
                    ),
                    Text(medicines.strength!,style: Theme.of(context).textTheme.titleMedium!),
                    Divider(color: Theme.of(context).textTheme.titleLarge!.color!.withOpacity(.5)),
                    companyStreamToText(medicines.companyDetails!),
                    genericStreamToText(medicines.generic!,)
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
