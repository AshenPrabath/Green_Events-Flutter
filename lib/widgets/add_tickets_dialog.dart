// add_ticket_dialog.dart
import 'package:application8/services/ticket_service.dart';
import 'package:flutter/material.dart';
import '../models/ticket_model.dart';
import '../widgets/input_textfield.dart';

class AddTicketDialog extends StatefulWidget {
  final Function(Ticket) onTicketAdded;

  const AddTicketDialog({required this.onTicketAdded});

  @override
  State<AddTicketDialog> createState() => _AddTicketDialogState();
}

class _AddTicketDialogState extends State<AddTicketDialog> {
  String ticketType = '';
  double ticketPrice = 0;
  int ticketCount = 0;
  @override
  Widget build(BuildContext context) {
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
                onChanged: (ticketType) {
                  ticketType = ticketType;
                },
              ),
              InputTextField(
                textInputType: TextInputType.number,
                labelText: "Ticket Price",
                hint: "Enter ticket Price (LKR)",
                onChanged: (ticketPriceDialog) {
                  ticketPrice = double.parse(ticketPriceDialog);
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
        TextButton(
          onPressed: () {
            TicketService.addTicket(
              eventId,
              ticketType,
              ticketPrice,
              ticketCount,
            );
            Navigator.of(context).pop();
          },
          child: const Text("Add"),
        ),
      ],
    );
  }
}
