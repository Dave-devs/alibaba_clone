import 'package:flutter/material.dart';

class WebScreen extends StatefulWidget {
  static const String routeName = '/web_screen_page';
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Web Screen'),
      ),
    );
  }
}
