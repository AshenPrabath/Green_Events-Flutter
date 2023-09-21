import 'package:flutter/material.dart';
import '../widgets/custom_filled_button.dart';
import '../widgets/custom_toggle_button.dart';
import '../widgets/ticket_medium.dart';
import '../widgets/total_price_container.dart';

class BuyTicketPage extends StatefulWidget {
  const BuyTicketPage({super.key});

  @override
  State<BuyTicketPage> createState() => _BuyTicketPageState();
}

class _BuyTicketPageState extends State<BuyTicketPage> {
  int selectedButtonIndex = -1;
  int ticketCount = 0;

  void incrementTicketCount() {
    setState(() {
      ticketCount++;
    });
  }

  void decrementTicketCount() {
    setState(() {
      ticketCount--;
    });
  }

  void onSelectButton(int index) {
    setState(() {
      selectedButtonIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        title: Text(
          "Buy Ticket",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                children: [
                  const TicketMedium(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    child: OverflowBar(
                      overflowSpacing: 11,
                      children: [
                        CustomToggleButton(
                          ticketType: "label",
                          ticketPrice: 2000,
                          isSelected: selectedButtonIndex == 0,
                          onSelect: (isSelected) => onSelectButton(0),
                        ),
                        CustomToggleButton(
                          ticketType: "label",
                          ticketPrice: 2000,
                          isSelected: selectedButtonIndex == 1,
                          onSelect: (isSelected) => onSelectButton(1),
                        ),
                        CustomToggleButton(
                          ticketType: "label",
                          ticketPrice: 2000,
                          isSelected: selectedButtonIndex == 2,
                          onSelect: (isSelected) => onSelectButton(2),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 23),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FilledButton(
                          onPressed: () {
                            if (ticketCount > 0) {
                              decrementTicketCount();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(15),
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                          ),
                          child: Icon(
                            Icons.remove,
                            color: Theme.of(context).colorScheme.onSurface,
                            size: 23,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            ticketCount.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                          ),
                        ),
                        FilledButton(
                          onPressed: () {
                            incrementTicketCount();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(15),
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Theme.of(context).colorScheme.onSurface,
                            size: 23,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 9),
                    child: TotalPriceContainer(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CustomFilledButton(
                        onPressed: () {}, buttonText: "Buy Ticket(s)"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
