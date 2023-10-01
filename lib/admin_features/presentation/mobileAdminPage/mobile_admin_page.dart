import 'package:flutter/material.dart';

class MobileAdminPage extends StatefulWidget {
  static String routeName = '/mobile_admin_page';
  const MobileAdminPage({Key? key}) : super(key: key);

  @override
  State createState() => _MobileAdminPageState();
}

class _MobileAdminPageState extends State<MobileAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Admin Bottom Bar Page'),
      ),
      body: Container(),
    );
  }
}
