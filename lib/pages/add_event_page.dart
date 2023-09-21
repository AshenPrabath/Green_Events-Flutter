import 'package:flutter/material.dart';

import '../pages/add_tickets.dart';
import '../Services/event_service.dart';
import '../Services/user_service.dart';
import '../widgets/custom_filled_button.dart';
import '../widgets/date_picker_textfield.dart';
import '../widgets/input_large_textfield.dart';
import '../widgets/input_textfield.dart';
import '../widgets/time_picker_textfield.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formKey = GlobalKey<FormState>();
  String eventUrl = "";
  String eventTitle = '';
  late TimeOfDay eventTime;
  late DateTime eventDate;
  String eventVenue = '';
  final TextEditingController _descText = TextEditingController();
  String? eventLink;

  String buttonText = "Publish as a free event";

  int get combinedDateTime => DateTime(
        eventDate.year,
        eventDate.month,
        eventDate.day,
        eventTime.hour,
        eventTime.minute,
      ).millisecondsSinceEpoch;

  @override
  void dispose() {
    _descText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        title: Text(
          "Add Event",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Image.asset('lib/assets/Group 9.png'),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: OverflowBar(
                  overflowSpacing: 15,
                  children: [
                    const SizedBox(),
                    InputTextField(
                      labelText: "Event Title",
                      hint: "Give a title to the event",
                      isPassword: false,
                      onChanged: (text) {
                        eventTitle = text;
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TimePickerTextField(
                          hint: "TIme",
                          onTimePicked: (pickedTime) {
                            eventTime = pickedTime;
                          },
                        ),
                        const Spacer(),
                        DatePickerTextField(
                          hint: "Date",
                          onDatePicked: (pickedDate) {
                            eventDate = pickedDate;
                          },
                        )
                      ],
                    ),
                    InputTextField(
                      labelText: "Venue",
                      hint: "Enter the location ",
                      suffixIcon: Icons.location_on_outlined,
                      onChanged: (value) {
                        eventVenue = value;
                      },
                    ),
                    InputLargeTextField(
                      controller: _descText,
                      maxLength: 250,
                    ),
                    InputTextField(
                      isOptional: true,
                      labelText: "External Link",
                      hint: "Paste if you have any external Links.",
                      helperText: "*Optional",
                      suffixIcon: Icons.link,
                      onChanged: (value) {
                        eventLink = value;
                      },
                    ),
                    OverflowBar(
                      overflowSpacing: 7,
                      children: [
                        CustomFilledButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await EventService.addEvent(
                                  UserService.getUserId(),
                                  eventTitle,
                                  eventUrl,
                                  combinedDateTime,
                                  eventVenue,
                                  _descText.text.toString(),
                                  true,
                                  eventLink,
                                );
                              }
                            },
                            buttonText: buttonText),
                        Center(
                          child: Text(
                            "or",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                          ),
                        ),
                        CustomFilledButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddTicket(
                                    // event: widget.events,
                                    ),
                              ),
                            );
                          },
                          buttonText: "Add Tickets",
                          buttonColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                          buttonTextColor: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                        ),
                        const SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
