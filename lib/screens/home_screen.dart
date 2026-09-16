import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/traveller_providers.dart';
import '../widgets/state_views.dart';
import '../widgets/traveller_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final travellers = ref.watch(filteredTravellersProvider);
    final filter = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Find a companion'),
        actions: [
          IconButton(
            tooltip: 'Filters',
            onPressed: () => context.push('/filters'),
            icon: filter.isEmpty
                ? const Icon(Icons.tune)
                : Badge(
                    label: Text('${filter.activeCount}'),
                    child: const Icon(Icons.tune),
                  ),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        child: travellers.when(
          loading: () => const LoadingTravellerList(),
          error: (error, stackTrace) => ErrorStateView(
            message: error.toString().replaceFirst('Exception: ', ''),
            onRetry: () => ref.read(travellerListProvider.notifier).reload(),
          ),
          data: (list) {
            if (list.isEmpty) {
              return EmptyTravellerList(
                hasFilters: !filter.isEmpty,
                onClearFilters: () => ref.read(filterProvider.notifier).clear(),
              );
            }

            return RefreshIndicator(
              onRefresh: () =>
                  ref.read(travellerListProvider.notifier).reload(),
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                itemCount: list.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12, top: 4),
                      child: Text(
                        '${list.length} traveller${list.length == 1 ? '' : 's'} found',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                      ),
                    );
                  }

                  final traveller = list[index - 1];
                  return TravellerCard(
                    traveller: traveller,
                    onTap: () => context.push('/traveller/${traveller.id}'),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
