import 'package:flutter/material.dart';
import 'package:mighty_fin/utils/constants/colors.dart';

class BottomAppBarWalletBalanceWidget extends StatelessWidget {
  const BottomAppBarWalletBalanceWidget({
    super.key,
    required this.preferredSize,
  });

  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color(0xff663091),
            Color(0xff712f8a),
            Color(0xff7d2e81),
            Color(0xff8e2d75),
          ],
        ),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: "Welcome, ",
                  children: [
                    TextSpan(
                      text: "Musweu",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: textAmber,
                      ),
                    )
                  ]
                ),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: white,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Your Wallet Balance",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              Text(
                "K 52.00",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "See Details",
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}