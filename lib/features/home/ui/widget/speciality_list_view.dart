import 'package:doctor/features/home/data/model/home_response_model.dart';
import 'package:doctor/features/home/ui/widget/speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/home_cubit.dart';

class SpecialityListView extends StatefulWidget {
  final List<SpecializationsData> specializationDataList;
  const SpecialityListView({super.key, required this.specializationDataList});

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  var selectedSpecializationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        itemCount: widget.specializationDataList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecializationIndex = index;
              });
              context.read<HomeCubit>().getDoctors(
                  specializationId: widget.specializationDataList[index].id);
            },
            child: SpecialityListViewItem(
              itemIndex: index,
              selectedIndex: selectedSpecializationIndex,
              specializationDataList: widget.specializationDataList[index],
            ),
          );
        },
      ),
    );
  }
}
