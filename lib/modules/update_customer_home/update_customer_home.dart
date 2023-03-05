import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import 'update_cities/update_cities.dart';
import 'update_companies/update_companies.dart';
import 'update_machine_types/update_machine_types.dart';
import 'update_machines/update_machines.dart';


class UpdateCustomerHome extends StatefulWidget {
  const UpdateCustomerHome({Key? key}) : super(key: key);

  @override
  State<UpdateCustomerHome> createState() => _UpdateCustomerHomeState();
}

class _UpdateCustomerHomeState extends State<UpdateCustomerHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Home'),
      ),
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customCard(
                  onTap: () {
                    navigateTo(context, const UpdateCompaniesList());
                  },
                  title: 'All Companies'),
              customCard(
                  onTap: () {
                    navigateTo(context, const UpdateCities());
                  },
                  title: 'All Cities'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customCard(
                  onTap: () {
                    navigateTo(context, const UpdateMachines());
                  },
                  title: 'All Machines'),
              customCard(
                onTap: () {
                  navigateTo(context, const UpdateMachineTypes());
                },
                title: 'All Machine Types',
              ),
            ],
          ),
        ],
      ),

    );
  }


}
