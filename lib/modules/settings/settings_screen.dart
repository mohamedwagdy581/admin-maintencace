import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/cubit/cubit.dart';
import '../register/register_screen.dart';
import '../update_customer_home/update_customer_home.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Settings Screen',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customListTile(
              context: context,
              onTap: () {
                navigateTo(context, const UpdateCustomerHome());
              },
              prefixIcon: Icons.edit,
              suffixIcon: Icons.chevron_right,
              title: 'Update Customer Home',
              subTitle: 'Update Lists of Company and Devices',
            ),
            SizedBox(
              height: height * 0.033,
            ),

            customListTile(
              context: context,
              onTap: () {
                navigateTo(context, RegisterScreen());
              },
              prefixIcon: Icons.add,
              suffixIcon: Icons.chevron_right,
              title: 'Add User',
              subTitle: 'Add User Details',
            ),

            SizedBox(
              height: height * 0.033,
            ),
            customListTile(
              context: context,
              onTap: () {
                AppCubit.get(context).changeAppModeTheme();
              },
              prefixIcon: Icons.brightness_4_outlined,
              suffixIcon: AppCubit.get(context).isDark
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
              title: AppCubit.get(context).isDark ? 'Light' : 'Dark',
              subTitle: 'Click to Switch Theme',
            ),

            SizedBox(
              height: height * 0.05,
            ),

            // Logout Button
            SizedBox(
              width: width * 0.4,
              child: defaultButton(
                onPressed: () {
                  signOut(context);
                },
                text: 'LOGOUT',
                backgroundColor: AppCubit.get(context).isDark
                    ? Colors.blue
                    : Colors.deepOrange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customListTile({
    required context,
    VoidCallback? onTap,
    required IconData prefixIcon,
    required IconData suffixIcon,
    required String title,
    required String subTitle,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          onTap: onTap,
          leading: Icon(
            prefixIcon,
            color:
                AppCubit.get(context).isDark ? Colors.blue : Colors.deepOrange,
            size: 35.0,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            subTitle,
            style: Theme.of(context).textTheme.caption,
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              suffixIcon,
              color: AppCubit.get(context).isDark
                  ? Colors.blue
                  : Colors.deepOrange,
            ),
          ),
        ),
      );
}
