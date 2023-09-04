// ignore_for_file: unused_import

import "dart:developer";

import "package:flutter/material.dart";
import "package:nsbm_eventmanagentapplication/view/addeventororganization.dart";
import "package:nsbm_eventmanagentapplication/view/bookings.dart";
import "package:nsbm_eventmanagentapplication/view/profile.dart";
import "package:nsbm_eventmanagentapplication/view/search.dart";
import "package:nsbm_eventmanagentapplication/view/timeline.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = [
    TimeLine(),
    Search(),
    AddEventOrOrganizationPage(),
    Bookings(),
    Profile()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = TimeLine();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          if(index == 0){
            setState(() {
              currentScreen = TimeLine();
              currentTab = 0;
            });
          } else if(index == 1){
            setState(() {
              currentScreen = Search();
              currentTab = 1;
            });
          } else if(index == 2){
            setState(() {
              currentScreen = AddEventOrOrganizationPage();
              currentTab = 2;
            });
          } else if(index == 3){
            setState(() {
              currentScreen = Bookings();
              currentTab = 3;
            });      
          } else {
            setState(() {
              currentScreen = Profile();
              currentTab = 4;
            });
          }
        },
        selectedIndex: currentTab,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.add),
            label: 'Saved',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book),
            label: 'Bookings',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
