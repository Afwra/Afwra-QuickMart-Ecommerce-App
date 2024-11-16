import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/cart/data/models/cart_item_model/cart_item.dart';
import 'package:quick_mart/features/cart/presentation/view_models/cubit/my_cart_cubit.dart';

class CustomMyCartListViewItemCounter extends StatefulWidget {
  const CustomMyCartListViewItemCounter({
    super.key,
    required this.item,
  });

  final CartItem item;
  @override
  State<CustomMyCartListViewItemCounter> createState() =>
      _CustomMyCartListViewItemCounterState();
}

class _CustomMyCartListViewItemCounterState
    extends State<CustomMyCartListViewItemCounter> {
  late int count;
  @override
  void initState() {
    count = widget.item.quantity;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.kGrey50),
      ),
      padding: const EdgeInsets.all(4),
      height: 32.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (count > 1) {
                count--;
                setState(() {});
                BlocProvider.of<MyCartCubit>(context)
                    .updateCartItem(cartId: widget.item.id, quantity: count);
              }
            },
            child: Icon(
              Icons.remove,
              color: AppSettings.darkMode
                  ? Colors.white
                  : AppColors.kBrandColorBlack,
              size: 20,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            count.toString(),
            style: AppTextStyles.body1Medium.copyWith(
                color: AppSettings.darkMode
                    ? Colors.white
                    : AppColors.kBrandColorBlack),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () {
              count++;
              setState(() {});
              BlocProvider.of<MyCartCubit>(context)
                  .updateCartItem(cartId: widget.item.id, quantity: count);
            },
            child: Icon(
              Icons.add,
              color: AppSettings.darkMode
                  ? Colors.white
                  : AppColors.kBrandColorBlack,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
