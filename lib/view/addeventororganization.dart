import 'package:flutter/material.dart';
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
    _showBottomSheet(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TimeLine(),
    );
  }

  void _showBottomSheet() {
  WidgetsBinding.instance!.addPostFrameCallback((_) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.business), 
                label: Text('Add Organization'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.event), 
                label: Text('Add New Event'),
              ),
            ],
          ),
        );
      },
    );
  });
}

}
