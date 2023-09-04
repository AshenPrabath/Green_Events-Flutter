import 'package:flutter/material.dart';
import 'package:nsbm_eventmanagentapplication/view/addevent_tickets.dart';
// ignore: unused_import
import 'package:nsbm_eventmanagentapplication/view/timeline.dart' hide TimeLine;

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
      body: TimeLine(), // This will use TimeLine from the view/timeline.dart file.
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
                    Navigator.pop(context); // Close the bottom sheet
                  },
                  child: Text('Add Organization'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the AddEventTicketPage when "Add New Event" is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Addevent_ticketPage(), // Replace AddEventTicketPage with the correct class name
                      ),
                    );
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
