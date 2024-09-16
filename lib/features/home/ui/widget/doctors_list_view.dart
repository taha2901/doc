import 'package:doctor/features/home/data/model/home_response_model.dart';
import 'package:flutter/material.dart';
import 'doctors_list_view_item.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key,required this.doctorList});
  final List<Doctors> doctorList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorList.length,
        itemBuilder: (context, index) {
          return DoctorsListViewItem(doctorsModel: doctorList[index],);
        },
      ),
    );
  }
}
