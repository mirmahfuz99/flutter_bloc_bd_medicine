import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/bloc/bd_medicine_bloc.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/bloc/bd_medicine_state.dart';
import 'package:flutter_bloc_bd_medicine/models/medicine.dart';

List<Medicine> employee_list = [];

class EmployeeListPage extends StatefulWidget {
  @override
  _EmployeeListPageState createState() => new _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  @override
  void initState() {
    super.initState();
    // getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Names'),
      ),
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
            return ListView.separated(
                separatorBuilder: (context, index) =>
                const Divider(height: 0.5, color: Colors.black38),
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.medicines!.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                        state.medicines!.elementAt(index).name
                    ),
                  );
                });
          }
          return const SizedBox();
        },
      ),
    );
  }
}