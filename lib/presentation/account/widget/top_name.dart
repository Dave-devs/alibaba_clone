import 'package:alibaba_clone/presentation/authentication/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopNameBar extends StatelessWidget {
  const TopNameBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final user = ref.watch(userChangedNotifierProvider).user;
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: RichText(
            text: TextSpan(
              text: 'Hello, ',
              children: [
                TextSpan(text: user.name)
              ]
            )
          ),
        );
      }
    );
  }
}