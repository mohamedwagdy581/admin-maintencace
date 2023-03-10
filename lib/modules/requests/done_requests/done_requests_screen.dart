import 'package:flutter/material.dart';

import '../../../layout/home_layout.dart';
import '../../../shared/components/components.dart';
import '../../../shared/network/cubit/cubit.dart';
import '../all_requests/done_archived_details_screen.dart';
import '../all_requests/get_requests_data.dart';

class DoneRequestsScreen extends StatelessWidget {
  final String city;
  const DoneRequestsScreen({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Done Requests'),
      ),
      body: FutureBuilder(
        future: cubit.getDoneDocId(city: city),
        builder: (context, snapshot) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            itemBuilder: (context, index) => customListTile(
              onTapped: () {
                navigateTo(
                    context,
                    DoneArchivedDetailsScreen(
                      id: cubit.doneDocIDs[index],
                      collection: 'doneRequests',
                      city: city,
                      currentIndex: index,
                    ));
              },
              title: GetRequestsData(
                city: city,
                collection: 'doneRequests',
                documentId: cubit.doneDocIDs[index],
                documentDataKey: 'companyName',
              ),
              leadingWidget: Icon(
                Icons.history_outlined,
                color: AppCubit.get(context).isDark
                    ? Colors.blue
                    : Colors.deepOrange,
              ),
              trailingWidget: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.chevron_right,
                  color: AppCubit.get(context).isDark
                      ? Colors.blue
                      : Colors.deepOrange,
                ),
              ),
            ),
            separatorBuilder: (context, index) => const Divider(
              thickness: 2.0,
            ),
            itemCount: cubit.doneDocIDs.length,
          );
        },
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
