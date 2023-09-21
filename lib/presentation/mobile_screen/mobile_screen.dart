import 'package:flutter/material.dart';

class MobileScreen extends StatefulWidget {
  static const String routeName = '/mobile_screen_page';
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: const Center(child: Text('Mobile Screen'),),
    );
  }
}