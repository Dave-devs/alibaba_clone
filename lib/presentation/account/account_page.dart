import 'package:alibaba_clone/services/account_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alibaba_clone/presentation/account/widget/appbar_name.dart';
import 'package:alibaba_clone/presentation/account/widget/four_buttons.dart';
import 'package:alibaba_clone/presentation/account/widget/orders.dart';

class AccountPage extends ConsumerStatefulWidget {
  static const String routeName = '/profile_page';
  const AccountPage({super.key});

  @override
  ConsumerState<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends ConsumerState<AccountPage> {
  final AccountServices accountServices = AccountServices();

  void logOut() {
    accountServices.logOut(context: context, ref: ref);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/alibaba_group.png',
          scale: 10,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: Column(
        children: [
          //Hello Name
          const AppBarName(),

          SizedBox(height: 10.h),

          FourButtons(
            onLogOutPressed: logOut
          ),

          SizedBox(height: 20.h),

          const Orders(),
        ],
      ),
    );
  }
}
