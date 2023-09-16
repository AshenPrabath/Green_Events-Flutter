import 'package:flutter/material.dart';

class AddticketsPage extends StatefulWidget {
  const AddticketsPage({Key? key}) : super(key: key);

  @override
  State<AddticketsPage> createState() => _AddticketPageState();
}

class _AddticketPageState extends State<AddticketsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _ticketNameController = TextEditingController();
  final TextEditingController _ticketPriceController = TextEditingController();
  final TextEditingController _availableTicketsController = TextEditingController();

  void _showAddTicketDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add Tickets"),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: _ticketNameController,
                  decoration: const InputDecoration(labelText: 'Ticket Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a ticket name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _ticketPriceController,
                  decoration: const InputDecoration(labelText: 'Ticket Price'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a ticket price';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _availableTicketsController,
                  decoration: const InputDecoration(labelText: 'Available Tickets'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the number of available tickets';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add tickets"),
        backgroundColor: const Color(0xFFD1E8D4),
        actions: [
          TextButton(
            onPressed: () {
              
            },
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF006D3E),
            ),
            child: const Text(
              "Publish",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: const Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTicketDialog(context);
        },
        backgroundColor: const Color(0xFFEFE9F5),
        child: const Icon(
          Icons.add,
          color: Color(0xFF006D3E),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  @override
  void dispose() {
    _ticketNameController.dispose();
    _ticketPriceController.dispose();
    _availableTicketsController.dispose();
    super.dispose();
  }
}
