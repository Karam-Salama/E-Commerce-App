import 'package:flutter/material.dart';

import '../cubit/home_cubit.dart';
import 'custom_home_banners_item.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CustomHomeBannersList extends StatelessWidget {
  const CustomHomeBannersList({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * 0.95;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is BannersLoadingState) {
          return const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is BannersFailureState) {
          return SizedBox(
            height: 200,
            child: Center(child: Text(state.errorMessage)),
          );
        } else if (state is BannersSuccessState) {
          return SizedBox(
            height: 185,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.banners.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final banner = state.banners[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SizedBox(
                    width: cardWidth,
                    child: CustomHomeBannersItem(imageUrl: banner.image),
                  ),
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
