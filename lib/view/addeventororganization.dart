import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:nsbm_eventmanagentapplication/home.dart';
import 'package:nsbm_eventmanagentapplication/view/timeline.dart';
class AddEventOrOrganizationPage extends StatefulWidget {
  @override
  _AddEventOrOrganizationPageState createState() =>
      _AddEventOrOrganizationPageState();
}
class _AddEventOrOrganizationPageState
    extends State<AddEventOrOrganizationPage> {
  @override
  void initState() {
    super.initState();
    _showBottomSheet(); // Show the bottom sheet when the page is opened
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TimeLine(),
    );
  }

  void _showBottomSheet() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); 
                  },
                  child: Text('Add Organization'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Code to handle adding new event
                    Navigator.pop(context); // Close the bottom sheet
                  },
                  child: Text('Add New Event'),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
