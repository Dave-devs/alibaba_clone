import 'package:flutter/material.dart';

class AnalyticPage extends StatefulWidget {
  static const String routeName = '/analytic_page';
  const AnalyticPage({ Key? key }) : super(key: key);

  @override
  State createState() => _AnalyticPageState();
}

class _AnalyticPageState extends State<AnalyticPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics Page'),
      ),
      body: Container(),
    );
  }
}