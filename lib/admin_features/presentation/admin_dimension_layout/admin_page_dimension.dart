import 'package:flutter/material.dart';

class AdminScreenLayoutDimension extends StatefulWidget {
  final Widget mobileAdminPage, webAdminPage;
  static const String routeName = '/adminLayoutPage';
  const AdminScreenLayoutDimension({super.key, required this.mobileAdminPage, required this.webAdminPage });

  @override
  State createState() => _AdminScreenLayoutDimensionState();
}

class _AdminScreenLayoutDimensionState extends State<AdminScreenLayoutDimension> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if(constraints.maxWidth > 600) {
          return widget.webAdminPage;
        }
        return widget.mobileAdminPage;
      })
    );
  }
}