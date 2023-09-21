import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  static const String routeName = '/admin_page';
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Admin Screen'),
      ),
    );
  }
}
