import 'package:flutter/material.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/pages/brand_list_screen.dart';
import 'package:flutter_bloc_bd_medicine/features/bd_medicine/presentation/pages/medicine_list_screen.dart';

import 'features/bd_medicine/presentation/pages/generic_list_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
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
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        color: Colors.green[300],
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      indicatorPadding: EdgeInsets.zero, // Remove extra space around indicator
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
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