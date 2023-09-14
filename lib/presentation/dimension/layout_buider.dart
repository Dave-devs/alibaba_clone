import 'package:flutter/material.dart';

class ScreenLayoutDimension extends StatefulWidget {
  final Widget webScreen, mobileScreen;
  const ScreenLayoutDimension({super.key, required this.webScreen, required this.mobileScreen});

  @override
  State<ScreenLayoutDimension> createState() => _ScreenLayoutDimensionState();
}

class _ScreenLayoutDimensionState extends State<ScreenLayoutDimension> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if(constraints.maxWidth > 600) {
          return widget.webScreen;
        }

        return widget.mobileScreen;
      })
    );
  }
}