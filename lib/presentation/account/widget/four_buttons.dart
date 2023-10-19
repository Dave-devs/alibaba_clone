// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:alibaba_clone/presentation/account/widget/account_button.dart';

class FourButtons extends StatelessWidget {
  final void Function()? onYourOrderPressed;
  final void Function()? onYourBecomeASellerPressed;
  final void Function()? onYourYourWishListPressed;
  final void Function()? onLogOutPressed;
  const FourButtons({
    Key? key,
    this.onYourOrderPressed,
    this.onYourBecomeASellerPressed,
    this.onYourYourWishListPressed,
    this.onLogOutPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: 'Your Orders',
              onPressed: onYourOrderPressed,
            ),
            AccountButton(
              text: 'Become A Seller',
              onPressed: onYourBecomeASellerPressed,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            AccountButton(
                text: 'Your Wish List',
                onPressed: onYourYourWishListPressed
                ),
            AccountButton(
              text: 'Log Out',
              onPressed: onLogOutPressed,
            ),
          ],
        ),
      ],
    );
  }
}
