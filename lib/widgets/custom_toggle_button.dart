import 'package:flutter/material.dart';

class CustomToggleButton extends StatefulWidget {
  final String ticketType;
  final double ticketPrice;
  final bool isSelected;
  final Function(bool) onSelect;
  const CustomToggleButton({
    super.key,
    required this.ticketType,
    required this.isSelected,
    required this.onSelect,
    required this.ticketPrice,
  });

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.isSelected) {
          widget.onSelect(true);
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: Theme.of(context)
                  .colorScheme
                  .outlineVariant), // Black outline
          color: widget.isSelected
              ? Theme.of(context).colorScheme.secondaryContainer
              : Theme.of(context).colorScheme.surface, // Filled color
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.ticketType,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              Text(
                "LKR ${widget.ticketPrice}",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
