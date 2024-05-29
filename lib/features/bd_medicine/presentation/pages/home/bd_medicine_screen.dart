import 'package:flutter/material.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/pages/brand_list_screen.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/pages/generic_list_screen.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/pages/medicine_list_screen.dart';

class BDMedicineScreen extends StatefulWidget {
  const BDMedicineScreen({super.key});
  @override
  _BDMedicineScreenState createState() => _BDMedicineScreenState();
}
class _BDMedicineScreenState extends State<BDMedicineScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50.0,),
                const Text("Search Section",textAlign: TextAlign.center,),
                const SizedBox(height: 20.0,),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(.2),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      indicatorPadding: EdgeInsets.zero, // Remove extra space around indicator
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white,
                      dividerColor: Colors.transparent,
                      tabs: const [
                        Tab(text: 'Medicine'),
                        Tab(text: 'Generic'),
                        Tab(text: 'Brand'),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                    child: TabBarView(
                      children:  [
                        MedicineListScreen(),
                        GenericListScreen(),
                        BrandListScreen()
                      ],
                    )
                )
              ],
            ),
          )
      ),
    );
  }
}