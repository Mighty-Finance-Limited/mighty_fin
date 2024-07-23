import 'package:flutter/material.dart';
import '../../../utils/utils.dart';

class AuthBottomAppBarLogoContainer extends StatelessWidget {
  const AuthBottomAppBarLogoContainer({
    super.key,
    required this.preferredSize,
  });

  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: deeperPurple,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            30,
          ),
          bottomRight: Radius.circular(
            30,
          ),
        ),
      ),
      height: preferredSize.height,
      width: double.infinity,
      child: Image.asset(
        fit: BoxFit.cover,
        "assets/logo/logo-big.png",
      ),
    );
  }
}
