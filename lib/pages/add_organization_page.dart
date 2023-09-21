import 'package:flutter/material.dart';
import '../widgets/custom_filled_button.dart';
import '../widgets/input_textfield.dart';

class AddOrganizationPage extends StatelessWidget {
  const AddOrganizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        title: Text(
          "Add an Organization",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Save",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OverflowBar(
              overflowAlignment: OverflowBarAlignment.center,
              overflowSpacing: 22,
              children: [
                Image.asset(
                  "lib/assets/Group 1.png",
                  width: 94,
                  height: 94,
                ),
                InputTextField(
                  labelText: "Name",
                  hint: "Set a name for the Organization",
                  onChanged: (onChanged) {},
                ),
                InputTextField(
                  labelText: "Email",
                  hint: "Organization Email address",
                  textInputType: TextInputType.emailAddress,
                  onChanged: (onChanged) {},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 26),
              child: Text(
                "Admins",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InputTextField(
                  labelText: "Add Admin",
                  width: 250,
                  onChanged: (value) {},
                ),
                SizedBox(
                  width: 79,
                  child: CustomFilledButton(
                    onPressed: () {},
                    buttonText: "Add",
                    buttonColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    buttonTextColor:
                        Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
