import 'package:flutter/material.dart';

class MobieScreen extends StatefulWidget {
  const MobieScreen({super.key});

  @override
  State<MobieScreen> createState() => _MobieScreenState();
}

class _MobieScreenState extends State<MobieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: const Center(child: Text('Mobile Screen'),),
    );
  }
}