import 'package:green_events_2/models/organization_model.dart';
import 'package:flutter/material.dart';

import 'package:green_events_2/widgets/organization_data.dart';

class OrganizationInfoPage extends StatelessWidget {
  Organization organization;
  OrganizationInfoPage({
    super.key,
    required this.organization,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        title: Text(
          "Organization info",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 30),
        child: Column(
          children: [
            OrganizationData(
              organization: organization,
            ),
          ],
        ),
      ),
    );
  }
}
