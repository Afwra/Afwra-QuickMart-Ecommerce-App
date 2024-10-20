import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/custom_filter_list_tile.dart';

class CustomFilterBottomSheet extends StatefulWidget {
  const CustomFilterBottomSheet({
    super.key,
  });

  @override
  State<CustomFilterBottomSheet> createState() =>
      _CustomFilterBottomSheetState();
}

class FitlerModel {
  final String title;
  bool value;

  FitlerModel({required this.title, required this.value});
}

class _CustomFilterBottomSheetState extends State<CustomFilterBottomSheet> {
  List<FitlerModel> filterList = [
    FitlerModel(title: 'Price (Low to High)', value: true),
    FitlerModel(title: 'Price (High to Low)', value: false),
    FitlerModel(title: 'A - Z', value: false),
    FitlerModel(title: 'Z - A', value: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filter',
            style: AppTextStyles.body1Medium,
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CustomFitlerListTile(
                  isPressed: filterList[index].value,
                  title: filterList[index].title,
                  onChange: (value) {
                    for (var i = 0; i < filterList.length; i++) {
                      if (i == index) {
                        filterList[i].value = value!;
                      } else {
                        filterList[i].value = false;
                      }
                    }
                    setState(() {});
                  },
                );
              },
              itemCount: filterList.length,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: 'Apply',
              elevation: 0,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
