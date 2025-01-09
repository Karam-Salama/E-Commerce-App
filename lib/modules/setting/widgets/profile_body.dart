import 'package:flutter/material.dart';

import '../../auth/presentation/widgets/custom_auth_logo_widget.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: size.width * 0.08)),
          const SliverToBoxAdapter(child: CustomAuthLogo()),
          SliverToBoxAdapter(child: SizedBox(height: size.width * 0.08)),
          SliverToBoxAdapter(child: Center(child: Text("Profile Body")))
        ],
      ),
    );
  }
}
