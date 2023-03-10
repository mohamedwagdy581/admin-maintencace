import 'package:flutter/material.dart';

import '../../layout/home_layout.dart';
import '../../shared/components/components.dart';
import '../requests/all_requests/requests.dart';
import '../requests/archived_requests/archived_requests_screen.dart';
import '../requests/done_requests/done_requests_screen.dart';
import '../technicals/all_technicals/all_technicals_screen.dart';
import '../users/all_users/all_users_screen.dart';

class JazanScreen extends StatelessWidget {
  final String title;
  const JazanScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'جازان',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      // ***********************  The Scaffold Body  ***********************
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customCard(
                  onTap: () {
                    navigateTo(context, AllRequests(city: title,));
                  },
                  title: 'All Requests'),
              customCard(
                  onTap: () {
                    navigateTo(context, DoneRequestsScreen(city: title,));
                  },
                  title: 'Done Requests'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customCard(
                  onTap: () {
                    navigateTo(context, ArchivedRequestsScreen(city: title,));
                  },
                  title: 'Archived Requests'),
              customCard(
                onTap: () {
                  navigateTo(context, AllTechnicalsScreen(city: title,));
                },
                title: 'All Technicals',
              ),
            ],
          ),
          customCard(
            onTap: () {
              navigateTo(context, AllUsersScreen(city: title,));
            },
            title: 'All Users',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateAndFinish(context, const HomeLayout());
          },
          child: const Icon(Icons.home),
      ),
    );
  }
}
