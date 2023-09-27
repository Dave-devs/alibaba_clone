import 'package:alibaba_clone/presentation/profile/widget/account_button.dart';
import 'package:flutter/material.dart';

class FourButtons extends StatelessWidget {
  const FourButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: 'Your Orders',
              onPressed: () {},
            ),
            AccountButton(
              text: 'Become A Seller',
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            AccountButton(
                text: 'Your Wish List',
                onPressed: () {} //AccountServices().logOut(context),
                ),
            AccountButton(
              text: 'Log Out',
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
