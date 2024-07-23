import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mighty_fin/utils/constants/colors.dart';

import '../../authentication/blocs/auth_bloc.dart';

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
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            final user = state.user;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(text: "Welcome, ", children: [
                        TextSpan(
                          text: user.fname ?? 'N/A',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textAmber,
                          ),
                        )
                      ]),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: white,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Your Wallet Balance",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "K ${user.borrowedTotal.toDouble()}",
                      style: const TextStyle(
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
            );
          } else if (state is AuthFailure) {
            return const Text("User is Not Authenicated");
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: white,
              ),
            );
          }
        },
      ),
    );
  }
}
