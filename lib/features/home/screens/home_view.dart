import 'package:app2/core/theme.dart';
import 'package:app2/features/home/screens/profile.dart';
import 'package:app2/features/search/search.dart';
import 'package:app2/features/home/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

int clisks = 0;
List<Widget> screens = [
  const HomeViewBody(),
  const Search(),
  const Profile(),
];

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[clisks],
        bottomNavigationBar: BottomNavigationBar(
          mouseCursor: SystemMouseCursors.grab,
          selectedFontSize: 12.sp,
          selectedIconTheme: IconThemeData(color: Colors.blue, size: 22.sp),
          selectedItemColor: Colors.blue,
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
          currentIndex: clisks,
          type: BottomNavigationBarType.fixed,
          enableFeedback: true,
          onTap: (index) {
            setState(() {
              clisks = index; // تحديث الصفحة المحددة
            });
          },
          backgroundColor: Provider.of<ThemeProvider>(context, listen: false)
              .currentTheme
              .primaryColor,
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
