import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc/counter_bloc.dart';
import '../bloc/switch_bloc/switch_bloc.dart';

class CounterSliderPage extends StatelessWidget {
  const CounterSliderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Center(
                child: Text('Hello World! ${state.counter}'),
              ),
              const SizedBox(height: 100.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(IncrementEvent());
                    },
                    child: const Text('increase'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(DecrementEvent());
                    },
                    child: const Text('decrease'),
                  )
                ],
              ),
              const SizedBox(height: 100.0),
              BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) =>
                    previous.isSwitch != current.isSwitch,
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Notification'),
                      Switch(
                          value: state.isSwitch,
                          onChanged: (v) {
                            context.read<SwitchBloc>().add(
                                  EnableDisableNotification(),
                                );
                          }),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20.0),
              BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) =>
                    previous.slider != current.slider,
                builder: (context, state) {
                  return Column(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.deepOrange.withOpacity(state.slider),
                      ),
                      Slider(
                          value: state.slider,
                          activeColor:
                              Colors.deepOrange.withOpacity(state.slider),
                          onChanged: (value) {
                            context
                                .read<SwitchBloc>()
                                .add(SliderEvent(slider: value));
                          })
                    ],
                  );
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
