import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/assets.dart';

class CustomAuthLogo extends StatelessWidget {
  const CustomAuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SvgPicture.asset(Assets.assetsVectorsAuthLogo),
    );
  }
}
