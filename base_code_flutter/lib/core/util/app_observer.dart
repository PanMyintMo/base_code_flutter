
import 'package:flutter_riverpod/flutter_riverpod.dart';

base class ProviderLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    // logger.i(
    //   'Provider changed: ${provider.name ?? provider.runtimeType} → $newValue',
    // );
  }

  @override
  void didDisposeProvider(
    ProviderObserverContext context,
  ) {
    // logger.w(
    //   'Provider disposed: ${provider.name ?? provider.runtimeType}',
    // );
  }
}
