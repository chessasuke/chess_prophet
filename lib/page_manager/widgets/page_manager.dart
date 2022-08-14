import 'package:chess_prophet/common/constants/app_colors.dart';
import 'package:chess_prophet/common/constants/display_properties.dart';
import 'package:chess_prophet/common/utils/extensions.dart';
import 'package:chess_prophet/common/utils/utils.dart';
import 'package:chess_prophet/page_manager/models/app_page.dart';
import 'package:chess_prophet/services/analytics/events/actions_events.dart';
import 'package:chess_prophet/services/analytics/models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageManager extends ConsumerStatefulWidget {
  const PageManager({Key? key}) : super(key: key);

  @override
  ConsumerState<PageManager> createState() => _PageManagerState();
}

class _PageManagerState extends ConsumerState<PageManager> {
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
          onTap: (index) => _onItemTapped(index, ref),
        ),
      ),
    );
  }

  void _onItemTapped(int index, WidgetRef ref) {
    
    if (index == 1) {
      Utils.trackEvent(
        event: Event(name: ActionsEvents.goRatingTab.name),
        ref: ref,
      );
    } else if (index == 2) {
      Utils.trackEvent(
        event: Event(name: ActionsEvents.goNormTab.name),
        ref: ref,
      );
    }

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
