import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/traveller_providers.dart';

class ConnectButton extends ConsumerWidget {
  final String travellerId;
  final String travellerName;
  final bool expanded;

  const ConnectButton({
    super.key,
    required this.travellerId,
    required this.travellerName,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(connectStatusProvider(travellerId));

    final button = switch (status) {
      ConnectStatus.none => FilledButton.icon(
          onPressed: () => _sendRequest(context, ref),
          icon: const Icon(Icons.person_add_alt_1, size: 18),
          label: const Text('Connect'),
        ),
      ConnectStatus.pending => FilledButton(
          onPressed: null,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBox(
                width: 14,
                height: 14,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              SizedBox(width: 8),
              Text('Sending'),
            ],
          ),
        ),
      ConnectStatus.connected => OutlinedButton.icon(
          onPressed: null,
          icon: const Icon(Icons.check, size: 18),
          label: const Text('Requested'),
        ),
    };

    if (expanded) {
      return SizedBox(width: double.infinity, child: button);
    }
    return button;
  }

  Future<void> _sendRequest(BuildContext context, WidgetRef ref) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      await ref.read(connectionsProvider.notifier).connect(travellerId);
      messenger.showSnackBar(
        SnackBar(content: Text('Request sent to $travellerName')),
      );
    } catch (_) {
      messenger.showSnackBar(
        const SnackBar(content: Text('Could not send the request. Try again.')),
      );
    }
  }
}
