import 'dart:async';

abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

class CounterBLoC {
  CounterBLoC() {
    _counterEventController.stream.listen(_count);
  }

  int _counter = 0;
  _count(CounterEvent event) {
    if (event is IncrementEvent) {
      counterSink.add(++_counter);
    } else if (event is DecrementEvent) {
      counterSink.add(--_counter);
    }
  }

  final _counterStreamController = StreamController<int>();
  StreamSink<int> get counterSink => _counterStreamController.sink;
  Stream<int> get streamCounter => _counterStreamController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink {
    return _counterEventController.sink;
  }

  dispose() {
    _counterStreamController.close();
    _counterEventController.close();
  }
}
