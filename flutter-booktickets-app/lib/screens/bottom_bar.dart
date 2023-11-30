import 'package:app/screens/home_screen.dart';
import 'package:app/screens/profile_screen.dart';
import 'package:app/screens/search_screen.dart';
import 'package:app/screens/ticket_screen.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomeSCreen(),
    const SearchScreen(),
    const TicketScreen(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Bottom Bar"),
      // ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 10,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: const Color(0xFF526480),
          items: const [
            BottomNavigationBarItem(
                activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
                icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
                label: "Home"),
            BottomNavigationBarItem(
                activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
                icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
                label: "Search"),
            BottomNavigationBarItem(
                activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
                icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
                label: "Ticket"),
            BottomNavigationBarItem(
                activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
                icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
                label: "Profile"),
          ]),
    );
  }
}
