import 'package:flutter/material.dart';
import '../../../utils/utils.dart';

class ReferAFriendWidget extends StatelessWidget {
  const ReferAFriendWidget({
    super.key,
    required this.preferredSize,
  });

  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        width: preferredSize.height / 2,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              25,
            ),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color(0xff673296),
              Color(0xff753cad),
              Color(0xff8849cc),
              Color(0xff9c58ee),
            ],
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              tooltip: "Share with a friend",
              style: const ButtonStyle(
                padding: WidgetStatePropertyAll(
                  EdgeInsets.all(15),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(
                  Colors.white,
                ),
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.share_outlined,
                color: primary,
                size: 35,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Refer a Friend",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
