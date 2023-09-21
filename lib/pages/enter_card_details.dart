import 'package:application8/models/ticket_model.dart';
import 'package:flutter/material.dart';
import '../models/event_model.dart';
import '../widgets/custom_filled_button.dart';
import '../widgets/input_textfield.dart';
import '../widgets/month_picker_textfield.dart';
import '../widgets/ticket_small.dart';

class EnterCardDetails extends StatefulWidget {
  
  const EnterCardDetails({super.key,});

  @override
  State<EnterCardDetails> createState() => _EnterCardDetailsState();
}

class _EnterCardDetailsState extends State<EnterCardDetails> {
  Ticket? selectedTicket;
  Event? selectedEvent;
  int? quantity;
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        title: Text(
          "Enter Card Details",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ticketSmall(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: OverflowBar(
                      overflowSpacing: 20,
                      children: [
                        InputTextField(
                          labelText: "Card holder name",
                          onChanged: (value) {},
                        ),
                        InputTextField(
                          labelText: "Card Number",
                          textInputType: TextInputType.number,
                          onChanged: (value) {},
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MonthPickerTextfield(
                              hint: "Expiration (MM/YYYY)",
                              onDatePicked: (pickedDate) {
                                date = pickedDate;
                              },
                            ),
                            SizedBox(
                              width: 174,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                onChanged: (value) {},
                                maxLength: 3,
                                buildCounter: null,
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: OutlineInputBorder(),
                                  labelText: "CVV",
                                  hintText: "Enter CVV",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: CustomFilledButton(onPressed: () {}, buttonText: "Pay"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
