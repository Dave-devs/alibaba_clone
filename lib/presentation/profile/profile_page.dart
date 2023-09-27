import 'package:alibaba_clone/presentation/profile/widget/appbar_name.dart';
import 'package:alibaba_clone/presentation/profile/widget/orders.dart';
import 'package:alibaba_clone/presentation/profile/widget/four_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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

          const FourButtons(),

          SizedBox(height: 20.h),

          const Orders(),
        ],
      ),
    );
  }
}
