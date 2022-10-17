import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youth_care/constants.dart';
import 'package:youth_care/presentation/news/news_screen.dart';
import 'package:youth_care/presentation/takeful/takful_info.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});
  static String id='layoutscreen';

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _currentIndex = 0;
  PageController _pageController=PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            NewsScreen(),
            TakeFullScreen()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('News'),
            activeColor: primaryColor,
            icon: Icon(Icons.newspaper)
          ),
          BottomNavyBarItem(
            title: Text('TakeFul'),
            activeColor: primaryColor,
            icon: Icon(Icons.help)
          ),
          BottomNavyBarItem(
            title: Text('Setting'),
            activeColor: primaryColor,
            icon: Icon(Icons.settings)
          ),      
        ],
      ),
    );
  }
}
