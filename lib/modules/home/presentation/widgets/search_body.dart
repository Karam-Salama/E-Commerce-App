import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/validation.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/custom_search_text_form_field.dart';
import '../../../auth/presentation/widgets/custom_auth_logo_widget.dart';
import '../cubit/search_cubit.dart';
import 'custom_search_body_filtered_list.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final searchCubit = BlocProvider.of<SearchCubit>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 44)),
          const SliverToBoxAdapter(child: CustomAuthLogo()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(
            child: SearchTextFormField(
              hintText: AppStrings.search,
              keyboardType: TextInputType.text,
              controller: searchCubit.productName,
              validator: Validation.validateName,
              onPressed: () => searchCubit.getProductsBySearch(),
              suffixIcon: false,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
          const SliverToBoxAdapter(child: SearchBodyFilteredList()),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }
}
