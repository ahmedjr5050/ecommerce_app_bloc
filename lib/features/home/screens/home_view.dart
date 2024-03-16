import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:app2/features/home/screens/profile.dart';
import 'package:app2/features/search/search.dart';

import '../widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  final String namexx;

  const HomeView({
    Key? key,
    required this.namexx,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int clisks = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeViewBody(namexx: widget.namexx),
      const Search(),
      const Profile(),
    ];

    return SafeArea(
      child: Scaffold(
        body: screens[clisks], // استخدام الشاشة المحددة من القائمة
        bottomNavigationBar: BottomNavigationBar(
          mouseCursor: SystemMouseCursors.grab,
          selectedFontSize: 12.sp,
          selectedIconTheme: const IconThemeData(color: Colors.blue, size: 22),
          selectedItemColor: Colors.blue,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          currentIndex: clisks,
          type: BottomNavigationBarType.fixed,
          enableFeedback: true,
          onTap: (index) {
            setState(() {
              clisks = index; // تحديث الصفحة المحددة
            });
          },
          backgroundColor: Colors.white,
          elevation: 1,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
