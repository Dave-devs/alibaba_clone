import 'package:alibaba_clone/constants/core.dart';
import 'package:alibaba_clone/constants/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileScreen extends StatefulWidget {
  static const String routeName = '/mobile_screen_page';
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  late PageController _controller;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  onPageChange(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  onTap(int index) {
    _controller.jumpToPage(index);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: onPageChange,
        physics: const NeverScrollableScrollPhysics(),
        children: pageList,
      ),
      bottomNavigationBar: CupertinoTabBar(
        onTap: onTap,
        currentIndex: _pageIndex,
        iconSize: iconSize,
        height: bottomBarHeight,
        activeColor: blak,
        items: [
          BottomNavigationBarItem(
            icon: _pageIndex == 0 ? Container(
              width: w,
              height: h,
              decoration: BoxDecoration(
                color: flexSchemeLight.primary,
                borderRadius: BorderRadius.circular(bottomBarRadius)
              ),
              child: const Icon(Icons.home),
            ) : const Icon(Icons.home_outlined),
            label: ''
          ),

          BottomNavigationBarItem(
            icon: _pageIndex == 1 ? Container(
              width: w,
              height: h,
              decoration: BoxDecoration(
                color:flexSchemeLight.primary,
                borderRadius: BorderRadius.circular(bottomBarRadius)
              ),
              child: const Icon(Icons.person),
            ) : const Icon(Icons.person_outline),
            label: ''
          ),

          BottomNavigationBarItem(
            icon: _pageIndex == 2 ? Badge.count(
              count: 2,
              child: Container(
                width: w,
                height: h,
                decoration: BoxDecoration(
                  color: flexSchemeLight.primary,
                  borderRadius: BorderRadius.circular(bottomBarRadius)
                ),
                child: const Icon(Icons.shopping_cart),
              ),
            ) : const Icon(Icons.shopping_cart_outlined),
            label: ''
          ),
        ]
      ),
    );
  }
}