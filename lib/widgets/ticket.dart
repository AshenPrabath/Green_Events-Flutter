import 'package:flutter/material.dart';
import '../models/event_model.dart';

import '../widgets/custom_filled_button.dart';
import '../widgets/total_price_container.dart';

class TicketWidget extends StatelessWidget {
  final Event event;
  const TicketWidget({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 6.0;
    return Container(
      height: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: Image.asset(
                    "event.eventImage",
                    height: 102,
                    width: 102,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 11),
                        child: Text(
                          "event.eventTitle",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outlineVariant,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 6),
                          child: Text(
                            "event.ticketType",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 21),
              child: Container(
                width: 500, // Adjust the width of the dashed line
                height: 2, // Adjust the height of the dashed line
                decoration: const BoxDecoration(),
                child: CustomPaint(
                  painter: DashedLinePainter(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 21),
                          child: Text(
                            "event.eventDate.toLocal().toString().split(' ')[0]",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                          )),
                      Text(
                        "Name",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 21),
                        child: Text(
                          "event.ownerName",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                        ),
                      ),
                      Text(
                        "Ticket Price",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      Text(
                        "${"event.ticketPrice"} LKR",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Time",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 21),
                        child: Text(
                          "event.eventTime.format(context)",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                        ),
                      ),
                      Text(
                        "Venue",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 21),
                        child: Text(
                          "event.eventVenue",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                        ),
                      ),
                      Text(
                        "NO of tickets",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      Text(
                        "event.ticketCount".toString(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: TotalPriceContainer(totalPrice: 10,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                'lib/assets/Barcode-PNG-Photo 1.png',
                width: 319,
                height: 95,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CustomFilledButton(
                  onPressed: () {}, buttonText: "Download Ticket"),
            )
          ],
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black // Change the line color as needed
      ..strokeWidth = 1.0 // Adjust the line width as needed
      ..style = PaintingStyle.stroke;

    const double dashWidth = 5.0; // Adjust the dash width
    const double dashSpace = 3.0; // Adjust the dash spacing

    double startX = 0.0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0.0),
        Offset(startX + dashWidth, 0.0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
