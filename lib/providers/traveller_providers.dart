import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/mock_traveller_api.dart';
import '../data/traveller_repository.dart';
import '../models/traveller.dart';
import '../models/traveller_filter.dart';

// ---------------------------------------------------------------------------
// Dependency providers
//
// These wire the layers together. Because the repository is created by a
// provider, you could override it in a test with a fake one and every screen
// would use the fake without changing a single widget.
// ---------------------------------------------------------------------------

final travellerApiProvider = Provider<MockTravellerApi>((ref) {
  return MockTravellerApi();
});

final travellerRepositoryProvider = Provider<TravellerRepository>((ref) {
  return TravellerRepository(ref.watch(travellerApiProvider));
});

// ---------------------------------------------------------------------------
// The traveller list - an AsyncNotifier
//
// An AsyncNotifier holds an AsyncValue, which is always in exactly one of
// three states: loading, error, or data. That is why the UI is forced to
// handle all three - you cannot forget one.
// ---------------------------------------------------------------------------

class TravellerListController extends AsyncNotifier<List<Traveller>> {
  /// `build` runs once when the provider is first read. Whatever it returns
  /// becomes the data. While the Future is running, the state is loading.
  /// If it throws, the state is error.
  @override
  Future<List<Traveller>> build() {
    return ref.watch(travellerRepositoryProvider).getTravellers();
  }

  /// Used by pull-to-refresh and by the Retry button on the error state.
  ///
  /// `AsyncValue.guard` runs the future and automatically converts a thrown
  /// exception into `AsyncValue.error` instead of crashing.
  Future<void> reload() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(travellerRepositoryProvider).getTravellers(),
    );
  }
}

final travellerListProvider =
    AsyncNotifierProvider<TravellerListController, List<Traveller>>(
  TravellerListController.new,
);

// ---------------------------------------------------------------------------
// The current filter - a plain Notifier (synchronous state)
// ---------------------------------------------------------------------------

class FilterController extends Notifier<TravellerFilter> {
  @override
  TravellerFilter build() => const TravellerFilter();

  void apply(TravellerFilter filter) => state = filter;

  void clear() => state = const TravellerFilter();
}

final filterProvider = NotifierProvider<FilterController, TravellerFilter>(
  FilterController.new,
);

// ---------------------------------------------------------------------------
// Derived state
//
// This provider does not own any data. It watches two other providers and
// computes a result. When either input changes, it recomputes automatically
// and every widget watching it rebuilds.
//
// Note that the original list is never modified - filtering produces a new
// list. That is what keeps state predictable.
// ---------------------------------------------------------------------------

final filteredTravellersProvider = Provider<AsyncValue<List<Traveller>>>((ref) {
  final travellers = ref.watch(travellerListProvider);
  final filter = ref.watch(filterProvider);

  // `whenData` keeps loading and error states untouched and only transforms
  // the data case.
  return travellers.whenData(
    (list) => list.where(filter.matches).toList(),
  );
});

/// Look up one traveller by id. `family` lets a provider take an argument.
/// The detail screen uses this so it does not need the traveller passed to it -
/// it only needs the id from the URL.
final travellerByIdProvider = Provider.family<Traveller?, String>((ref, id) {
  final list = ref.watch(travellerListProvider).valueOrNull;
  if (list == null) return null;
  for (final traveller in list) {
    if (traveller.id == id) return traveller;
  }
  return null;
});

// ---------------------------------------------------------------------------
// Connect requests
//
// Mirrors how Onyatrips actually models this: a request has a status, and
// "connected" only happens after the other side responds.
// ---------------------------------------------------------------------------

enum ConnectStatus { none, pending, connected }

class ConnectionController extends Notifier<Map<String, ConnectStatus>> {
  @override
  Map<String, ConnectStatus> build() => const {};

  ConnectStatus statusOf(String travellerId) {
    return state[travellerId] ?? ConnectStatus.none;
  }

  Future<void> connect(String travellerId) async {
    if (statusOf(travellerId) != ConnectStatus.none) return;

    // Optimistic UI: show "pending" immediately so the button reacts instantly,
    // instead of leaving the user staring at an unchanged screen.
    state = {...state, travellerId: ConnectStatus.pending};

    try {
      await ref
          .read(travellerRepositoryProvider)
          .sendConnectRequest(travellerId);
      state = {...state, travellerId: ConnectStatus.connected};
    } catch (_) {
      // The request failed, so roll the optimistic change back.
      final next = {...state};
      next.remove(travellerId);
      state = next;
      rethrow;
    }
  }
}

final connectionsProvider =
    NotifierProvider<ConnectionController, Map<String, ConnectStatus>>(
  ConnectionController.new,
);

/// Convenience provider so a button can watch just one traveller's status
/// and not rebuild when someone else's status changes.
final connectStatusProvider = Provider.family<ConnectStatus, String>((ref, id) {
  return ref.watch(connectionsProvider)[id] ?? ConnectStatus.none;
});
