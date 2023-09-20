// add_ticket_dialog.dart
import 'package:flutter/material.dart';
import '../models/ticket_model.dart';
import '../widgets/input_textfield.dart';

class AddTicketDialog extends StatelessWidget {
  final Function(Ticket) onTicketAdded;

  const AddTicketDialog({required this.onTicketAdded});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController countController = TextEditingController();
    TextEditingController typeController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    String ticketType = "";
    int ticketPrice;
    String ticketCount = "";

    return AlertDialog(
      title: const Text("Add Ticket"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OverflowBar(
            overflowSpacing: 16,
            children: [
              InputTextField(
                labelText: "Ticket name",
                hint: "Enter ticket name",
                onChanged: (ticketNameDialog) {
                  ticketType = ticketNameDialog;
                },
              ),
              InputTextField(
                labelText: "Ticket Price",
                hint: "Enter ticket Price (LKR)",
                onChanged: (ticketPriceDialog) {
                  ticketPrice = int.parse(ticketPriceDialog);
                },
              ),
              InputTextField(
                labelText: "Available No of tickets",
                hint: "Enter amount",
                onChanged: (ticketCountDialog) {
                  ticketType = ticketCountDialog;
                },
              ),
            ],
          )
          // TextFormField(
          //   controller: priceController,
          //   keyboardType: TextInputType.number,
          //   decoration: const InputDecoration(labelText: "Ticket Price"),
          // ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        // TextButton(
        //   onPressed: () {
        //     onTicketAdded(
        //       Ticket(
        //         ticketCount: int.parse(ticketCount),
        //         ticketType: typeController.text,
        //         ticketPrice: int.parse(priceController.text),
        //       ),
        //     );
        //     Navigator.of(context).pop();
        //   },
        //   child: const Text("Add"),
        // ),
      ],
    );
  }
}
