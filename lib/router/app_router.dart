import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../screens/filter_screen.dart';
import '../screens/home_screen.dart';
import '../screens/traveller_detail_screen.dart';

/// All routes live in one file.
///
/// Centralising navigation means you can see every screen in the app and every
/// way to reach it in one place. Scattering `Navigator.push(MaterialPageRoute(...))`
/// through fifty widgets makes that impossible.
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),

        // Nested routes. Their full paths become '/filters' and
        // '/traveller/:id', and they are children of home in the stack.
        routes: [
          GoRoute(
            path: 'filters',
            name: 'filters',
            builder: (context, state) => const FilterScreen(),
          ),
          GoRoute(
            // ':id' is a path parameter.
            path: 'traveller/:id',
            name: 'travellerDetail',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return TravellerDetailScreen(travellerId: id);
            },
          ),
        ],
      ),
    ],
  );
});
