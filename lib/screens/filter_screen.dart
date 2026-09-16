import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/traveller_filter.dart';
import '../providers/traveller_providers.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  String? _destination;
  String? _travellerType;
  String? _diet;
  bool _budgetEnabled = false;
  double _maxBudget = 30000;

  @override
  void initState() {
    super.initState();
    final current = ref.read(filterProvider);
    _destination = current.destination;
    _travellerType = current.travellerType;
    _diet = current.diet;
    if (current.maxBudget != null) {
      _budgetEnabled = true;
      _maxBudget = current.maxBudget!.toDouble();
    }
  }

  void _apply() {
    ref.read(filterProvider.notifier).apply(
          TravellerFilter(
            destination: _destination,
            travellerType: _travellerType,
            diet: _diet,
            maxBudget: _budgetEnabled ? _maxBudget.round() : null,
          ),
        );
    context.pop();
  }

  void _clearAll() {
    setState(() {
      _destination = null;
      _travellerType = null;
      _diet = null;
      _budgetEnabled = false;
      _maxBudget = 30000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          TextButton(
            onPressed: _clearAll,
            child: const Text('Clear all'),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            _SectionTitle('Destination'),
            _ChoiceRow(
              options: kDestinations,
              selected: _destination,
              onChanged: (value) => setState(() => _destination = value),
            ),
            const SizedBox(height: 20),
            _SectionTitle('Traveller type'),
            _ChoiceRow(
              options: kTravellerTypes,
              selected: _travellerType,
              onChanged: (value) => setState(() => _travellerType = value),
            ),
            const SizedBox(height: 20),
            _SectionTitle('Diet'),
            _ChoiceRow(
              options: kDiets,
              selected: _diet,
              onChanged: (value) => setState(() => _diet = value),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: _SectionTitle('Maximum budget')),
                Switch(
                  value: _budgetEnabled,
                  onChanged: (value) => setState(() => _budgetEnabled = value),
                ),
              ],
            ),
            Slider(
              value: _maxBudget,
              min: 10000,
              max: 50000,
              divisions: 8,
              label: '₹${_maxBudget.round()}',
              onChanged: _budgetEnabled
                  ? (value) => setState(() => _maxBudget = value)
                  : null,
            ),
            Text(
              _budgetEnabled
                  ? 'Showing travellers budgeting up to ₹${_maxBudget.round()}'
                  : 'Budget filter is off',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _apply,
              child: const Text('Apply filters'),
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: Theme.of(context).textTheme.titleSmall),
    );
  }
}

class _ChoiceRow extends StatelessWidget {
  final List<String> options;
  final String? selected;
  final ValueChanged<String?> onChanged;

  const _ChoiceRow({
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.map((option) {
        final isSelected = selected == option;
        return ChoiceChip(
          label: Text(option),
          selected: isSelected,
          onSelected: (_) => onChanged(isSelected ? null : option),
        );
      }).toList(),
    );
  }
}
