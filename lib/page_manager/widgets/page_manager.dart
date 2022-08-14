import 'package:chess_prophet/common/constants/app_colors.dart';
import 'package:chess_prophet/common/constants/display_properties.dart';
import 'package:chess_prophet/common/utils/extensions.dart';
import 'package:chess_prophet/page_manager/models/app_page.dart';
import 'package:flutter/material.dart';

class PageManager extends StatefulWidget {
  const PageManager({Key? key}) : super(key: key);

  @override
  State<PageManager> createState() => _PageManagerState();
}

class _PageManagerState extends State<PageManager> {
  late int _selectedIndex;
  late PageController pageController;
  late double bottomViewPadding;
  @override
  void initState() {
    _selectedIndex = 0;
    pageController = PageController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    bottomViewPadding = MediaQuery.of(context).viewPadding.bottom;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: _onPageChanged,
        children: Pages.values.map((page) => page.page()).toList(),
      ),
      bottomNavigationBar: SizedBox.fromSize(
        size: Size.fromHeight(
            DisplayProperties.bottomNavigationBarHeight + bottomViewPadding),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: Pages.values
              .map(
                (page) => BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(page.icon()),
                  label: page.name.capitalize(),
                ),
              )
              .toList(),
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.pink,
          unselectedItemColor: AppColors.grayNeutral300,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.animateToPage(_selectedIndex,
          duration: const Duration(milliseconds: 250), curve: Curves.bounceIn);
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
