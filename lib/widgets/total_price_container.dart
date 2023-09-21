import 'package:flutter/material.dart';

class TotalPriceContainer extends StatelessWidget {
  const TotalPriceContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Center(
          child: Text(
            "Total Price ${"event.ticketCount"} LKR",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer),
          ),
        ),
      ),
    );
  }
}
