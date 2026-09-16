import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router/app_router.dart';

void main() {
  // ProviderScope stores the state of every provider. Without it at the root,
  // any ref.watch throws. This is always the first thing you add to a
  // Riverpod app.
  runApp(const ProviderScope(child: TravellerDemoApp()));
}

class TravellerDemoApp extends ConsumerWidget {
  const TravellerDemoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    // MaterialApp.router (not plain MaterialApp) is what hands navigation over
    // to go_router.
    return MaterialApp.router(
      title: 'Traveller Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF004445)),
      ),
      routerConfig: router,
    );
  }
}
