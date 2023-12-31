import 'package:alibaba_clone/constants/core.dart';
import 'package:alibaba_clone/constants/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileAdminPage extends StatefulWidget {
  static String routeName = '/mobile_admin_page';
  const MobileAdminPage({Key? key}) : super(key: key);

  @override
  State createState() => _MobileAdminPageState();
}

class _MobileAdminPageState extends State<MobileAdminPage> {
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
        children: adminPageList,
      ),
      bottomNavigationBar: CupertinoTabBar(
          onTap: onTap,
          currentIndex: _pageIndex,
          iconSize: iconSize,
          height: bottomBarHeight,
          activeColor: blak,
          items: [
            BottomNavigationBarItem(
            icon: _pageIndex == 0
              ? Container(
                  width: w,
                  height: h,
                  decoration: BoxDecoration(
                    color: flexSchemeLight.primary,
                    borderRadius: BorderRadius.circular(bottomBarRadius)
                  ),
                  child: const Icon(Icons.home),
                )
              : const Icon(Icons.home_outlined),
              label: ''
            ),
            BottomNavigationBarItem(
            icon: _pageIndex == 1
              ? Container(
                width: w,
                height: h,
                decoration: BoxDecoration(
                  color: flexSchemeLight.primary,
                  borderRadius: BorderRadius.circular(bottomBarRadius)
                ),
                child: const Icon(Icons.analytics),
              )
              : const Icon(Icons.analytics_outlined),
              label: ''
            ),
            BottomNavigationBarItem(
              icon: _pageIndex == 2
                ? Container(
                    width: w,
                    height: h,
                    decoration: BoxDecoration(
                      color: flexSchemeLight.primary,
                      borderRadius: BorderRadius.circular(bottomBarRadius)
                    ),
                    child: const Icon(Icons.shopping_bag),
                  )
                : const Icon(Icons.shopping_bag_outlined),
              label: ''
            ),
          ]
        ),
    );
  }
}
