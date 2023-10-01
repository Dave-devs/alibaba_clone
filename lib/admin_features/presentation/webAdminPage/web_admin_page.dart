import 'package:flutter/material.dart';

class WebAdminPage extends StatefulWidget {
  static String routeName = '/web_admin_page';
  const WebAdminPage({ Key? key }) : super(key: key);

  @override
  State createState() => _WebAdminPageState();
}

class _WebAdminPageState extends State<WebAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web Admin Bottom Bar Page'),
      ),
      body: Container(),
    );
  }
}