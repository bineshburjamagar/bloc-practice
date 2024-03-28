part of 'counter_bloc.dart';

class CounterState extends Equatable {
  const CounterState({required this.counter});
  final int counter;
  @override
  List<Object> get props => [counter];
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(counter: 0);
}
