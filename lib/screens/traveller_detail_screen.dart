import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/traveller_providers.dart';
import '../widgets/connect_button.dart';

class TravellerDetailScreen extends ConsumerWidget {
  final String travellerId;

  const TravellerDetailScreen({super.key, required this.travellerId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final traveller = ref.watch(travellerByIdProvider(travellerId));

    if (traveller == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Traveller')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('This traveller is no longer available.'),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () => context.go('/'),
                child: const Text('Back to travellers'),
              ),
            ],
          ),
        ),
      );
    }

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(traveller.name)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: theme.colorScheme.primaryContainer,
                    child: Text(
                      traveller.initials,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(traveller.name,
                            style: theme.textTheme.headlineSmall),
                        const SizedBox(height: 2),
                        Text(
                          '${traveller.age} · ${traveller.gender} · ${traveller.homeCity}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text('About', style: theme.textTheme.titleSmall),
              const SizedBox(height: 6),
              Text(traveller.bio, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 24),
              Text('Trip details', style: theme.textTheme.titleSmall),
              const SizedBox(height: 8),
              _InfoRow(label: 'Going to', value: traveller.destination),
              _InfoRow(label: 'Travelling from', value: traveller.homeCity),
              _InfoRow(label: 'Traveller type', value: traveller.travellerType),
              _InfoRow(label: 'Pace', value: traveller.pace),
              _InfoRow(label: 'Diet', value: traveller.diet),
              _InfoRow(label: 'Budget', value: '₹${traveller.budget}'),
              _InfoRow(label: 'Profession', value: traveller.profession),
              const SizedBox(height: 24),
              Text('Interests', style: theme.textTheme.titleSmall),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: traveller.interests
                    .map((interest) => Chip(label: Text(interest)))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: ConnectButton(
            travellerId: traveller.id,
            travellerName: traveller.name,
            expanded: true,
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: Text(value, style: theme.textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
