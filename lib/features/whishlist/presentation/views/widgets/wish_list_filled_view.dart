import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_settings.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/features/whishlist/presentation/view_model/wishlist_cubit/wishlist_cubit.dart';
import 'package:quick_mart/features/whishlist/presentation/views/widgets/custom_wishlist_list_view_item.dart';

class WishListFilledView extends StatelessWidget {
  const WishListFilledView({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<WishlistCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Wishlist',
          style: AppTextStyles.body2Medium.copyWith(
            color: AppSettings.darkMode
                ? Colors.white
                : AppColors.kBrandColorBlack,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (index < cubit.wishList.length) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: CustomWishlistListViewItem(
                    item: cubit.wishList[index],
                  ),
                );
              } else {
                if (cubit.moreDataLoading) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                        child: CircularProgressIndicator(
                      backgroundColor: AppColors.kBrandColorCyan,
                    )),
                  );
                }
                return const SizedBox();
              }
            },
            itemCount: cubit.wishList.length + 1,
            controller: cubit.listViewScrollController,
          ),
        ),
      ],
    );
  }
}
