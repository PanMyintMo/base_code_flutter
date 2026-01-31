import 'package:event_bus/event_bus.dart';

class EventBusService {
  EventBusService._private();

  late final EventBus eventBus;
  static final _instance = EventBusService._private();

  factory EventBusService() {
    return _instance;
  }

  Future<void> init() async {
    eventBus = EventBus(sync: true);
  }
}