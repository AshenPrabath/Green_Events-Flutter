import 'package:flutter/material.dart';
import '../pages/enter_card_details.dart';
import '../widgets/custom_filled_button.dart';
import '../widgets/custom_paymentmethod_button.dart';

class SelectPayment extends StatefulWidget {
  const SelectPayment({super.key});

  @override
  State<SelectPayment> createState() => _SelectPaymentState();
}

class _SelectPaymentState extends State<SelectPayment> {
  int selectedButtonIndex = -1;
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
          "Select Payment Method",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OverflowBar(
                overflowSpacing: 11,
                children: [
                  CustomPaymentMethodButton(
                    isSelected: selectedButtonIndex == 0,
                    onSelect: (isSelected) => onSelectButton(0),
                    methodName: "Mastercard",
                    imageURL: "lib/assets/media (2).png",
                  ),
                  CustomPaymentMethodButton(
                    isSelected: selectedButtonIndex == 1,
                    onSelect: (isSelected) => onSelectButton(1),
                    methodName: "Visa",
                    imageURL: "lib/assets/media (2).png",
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        textStyle: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: CustomFilledButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EnterCardDetails()),
                            );
                          },
                          buttonText: "Confirm"),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
