import 'package:application8/models/booking_model.dart';
import 'package:application8/models/event_model.dart';
import 'package:application8/models/ticket_model.dart';
import 'package:application8/services/event_service.dart';
import 'package:application8/services/ticket_service.dart';
import 'package:flutter/material.dart';

class TicketMiniCard extends StatelessWidget {
  final Booking booking;
  const TicketMiniCard({
    Key? key,
    required this.booking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 12.0;
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => TicketPage(event: event),
        //   ),
        // );
      },
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: Theme.of(context)
                .colorScheme
                .outlineVariant, // Change the border color as needed
            width: 1.0, // Adjust the border width as needed
          ),
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder<Ticket>(
                        future: TicketService.getTicketById(booking.ticketID),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return FutureBuilder<Event>(
                              future:
                                  EventService.getEventById(snapshot.data!.id),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(snapshot.data!.title);
                                }
                                return const Text("Loading");
                              },
                            );
                          }
                          return const Text("Loading");
                        },
                      ),
                      Text(
                        "event.eventTitle",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface),
                      ),
                      Text(
                        "event.ticketType",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(borderRadius),
                    bottomRight: Radius.circular(borderRadius)),
                child: Image.asset(
                  "event.eventImage",
                  height: 80,
                  width: 80,
                )),
          ],
        ),
      ),
    );
  }
}
