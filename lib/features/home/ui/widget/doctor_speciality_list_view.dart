import 'package:doctor/features/home/data/model/home_response_model.dart';
import 'package:doctor/features/home/ui/widget/dotor_speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListView extends StatelessWidget {
  final List<SpecializationsData> specializationDataList;
  const DoctorSpecialityListView(
      {super.key,required this.specializationDataList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        itemCount: specializationDataList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return DoctorSpecialityListViewItem(
            itemIndex: index,
            specializationDataList: specializationDataList[index],
          );
        },
      ),
    );
  }
}
