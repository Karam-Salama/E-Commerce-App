import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_filtered_product_card.dart';
import '../cubit/search_cubit.dart';

class SearchBodyFilteredList extends StatelessWidget {
  const SearchBodyFilteredList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      if (state is SearchLoadingState) {
        return const SizedBox(
          height: 200,
          child: Center(child: CircularProgressIndicator()),
        );
      } else if (state is SearchFailureState) {
        return SizedBox(
          height: 200,
          child: Center(child: Text(state.errorMessage)),
        );
      } else if (state is SearchSuccessState) {
        return GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            mainAxisExtent: 275,
          ),
          itemBuilder: (context, index) {
            final product = state.products[index];
            return CustomFilteredProductCard(product: product);
          },
        );
      }
      return const SizedBox.shrink();
    });
  }
}

