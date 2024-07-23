import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class RememberMeWidget extends StatelessWidget {
  const RememberMeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: false,
                onChanged: (value) {},
              ),
              const Text(
                "Remember Me",
                style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 13
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Forgot Password",
              style: TextStyle(
                color: textAmber,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}